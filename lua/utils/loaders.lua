-- Config functions for plugins that require more extensibility

local M = {}

local function lsp_on_attach(keys)
    return function (client, _)
        if client.server_capabilities.document_formatting then
            keys.saga_keys = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format text" }
        elseif client.server_capabilities.document_range_formatting then
            keys.saga_keys = { "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", "Range format" }
        end
        keys.general_keys = keys.saga_keys
        --require "which-key".register(keys.general_keys)
    end
end

function M.lspconfig(opts)
    local icons = {
        Hint = "",
        Info = "",
        Warn = "▲",
        Error = "🗙"
    }
    
    for type, icon in pairs(icons) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    end

    local lspconfig = require("lspconfig")
    for key, value in pairs(opts) do
        lspconfig[key].setup({
            -- on_attach = lsp_on_attach({}),
            settings = value
        })
    end
end

function M.mason_null_ls(opts)
    local mason_null_ls = require("mason-null-ls")
    mason_null_ls.setup(opts)
    mason_null_ls.setup_handlers()
end

function M.treesitter(opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    require("nvim-treesitter.configs").setup(opts.config)

    for key, value in pairs(opts.parsers) do
       parser_config[key] = value
    end
end

function M.material_theme(opts)
    require("material").setup(opts)
    vim.cmd("colorscheme material")
end

return M
