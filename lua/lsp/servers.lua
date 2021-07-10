require "general.helpers"
require "general.mappings"

local cmd = vim.cmd
local fn = vim.fn
local luasnip = require "luasnip"

_G.tab_complete = function()
	if fn.pumvisible() == 1 then
		return terms "<C-n>"
	elseif luasnip and luasnip.expand_or_jumpable() then
		return terms "<Plug>luasnip-expand-or-jump"
	elseif check_back_space() then
		return terms "<Tab>"
	else
		return fn['compe#complete']()
	end
end

_G.s_tab_complete = function()
	if fn.pumvisible() == 1 then
		return terms "<C-p>"
	elseif luasnip and luasnip.jumpable(-1) then
		return terms "<Plug>luasnip-jump-prev"
	else
		return terms "<S-Tab>"
	end
end

local function on_attach(client, bufnr)
	keys["<Space>"] = saga_keys
	map { "<Esc>", [[<C-\><C-n>:lua require'lspsaga.floaterm'.close_float_terminal()<CR>]], mode = 't' }
	cmd [[au CursorHold <buffer> lua require'lspsaga.diagnostic'.show_line_diagnostics()]]

	if client.resolved_capabilities.document_formatting then
		keys["<Space>"].f = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format text"}
	elseif client.resolved_capabilities.document_range_formatting then
		keys["<Space>"].f = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR>", "Range format"}
	end

	if client.resolved_capabilities.document_highlight then
		cmd[[
			augroup lsp_document_highlight
				au! * <buffer>
				au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]]
	end
	require "which-key".register(keys)
end

local cap = vim.lsp.protocol.make_client_capabilities()
cap.textDocument.completion.completionItem.snippetSupport = true

local defaults = {
	capabilities = cap;
	on_attach = on_attach;
}

language_servers({
	rust_analyzer = {};
	tsserver = {};
	julials = {};
	pyright = {};
	dartls = {};
	bashls = {};
	gopls = {};
	dockerls = {};
	html = {};
	cssls = {};
	svelte = {};
	yamlls = {
		settings = {
			yaml = {
				schemas = { kubernetes = "k-*" };
			}
		}
	};
}, defaults)

