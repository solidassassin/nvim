local utils = require "general.helpers"
local keys = require "general.mappings"

local cmd = vim.cmd
local fn = vim.fn
local luasnip = require "luasnip"

_G.tab_complete = function()
    if fn.pumvisible() == 1 then
        return utils.terms "<C-n>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return utils.terms "<Plug>luasnip-expand-or-jump"
    elseif utils.check_back_space() then
        return utils.terms "<Tab>"
    else
        return fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if fn.pumvisible() == 1 then
        return utils.terms "<C-p>"
    elseif luasnip and luasnip.jumpable(-1) then
        return utils.terms "<Plug>luasnip-jump-prev"
    else
        return utils.terms "<S-Tab>"
    end
end

local function on_attach(client, bufnr)
    utils.map {"<Esc>", [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]], mode = "t"}
    cmd [[au CursorHold <buffer> lua require'lspsaga.diagnostic'.show_line_diagnostics()]]

    if client.resolved_capabilities.document_formatting then
        keys.saga_keys.f = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format text"}
    elseif client.resolved_capabilities.document_range_formatting then
        keys.saga_keys.f = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR>", "Range format"}
    else
        keys.saga_keys.f = {"<Cmd>:Format<CR>", "Format text"}
    end

    if client.resolved_capabilities.document_highlight then
        cmd [[
            augroup lsp_document_highlight
                au! * <buffer>
                au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]]
    end
    keys.general_keys["<Space>"] = keys.saga_keys
    require "which-key".register(keys.general_keys)
end

local cap = vim.lsp.protocol.make_client_capabilities()
cap.textDocument.completion.completionItem.snippetSupport = true

local defaults = {
    capabilities = cap,
    on_attach = on_attach
}

require "flutter-tools".setup {
    lsp = {
        on_attach = on_attach
    }
}

utils.language_servers(
    {
        rust_analyzer = {},
        tsserver = {},
        julials = {},
        pyright = {},
        bashls = {},
        gopls = {},
        dockerls = {},
        terraformls = {},
        html = {},
        cssls = {},
        svelte = {},
        yamlls = {
            settings = {
                yaml = {
                    schemas = {kubernetes = "*"}
                }
            }
        },
        sumneko_lua = {
            cmd = {"lua-language-server"},
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {"vim", "_G"}
                    }
                }
            }
        }
    },
    defaults
)
