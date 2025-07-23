vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"mfussenegger/nvim-lint",
		-- "lukas-reineke/lsp-format.nvim"
	},
	config = function()
		require("lspconfig").gopls.setup {}
		require("lspconfig").rust_analyzer.setup {}
		require("lspconfig").zls.setup {}
		require("lspconfig").julials.setup {}
		require("lspconfig").terraformls.setup {}
		require("lspconfig").tflint.setup {}
		require("lspconfig").helm_ls.setup {}
		require("lspconfig").bashls.setup {}
		require("lspconfig").basedpyright.setup {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true
			}
		}
		require("lspconfig").lua_ls.setup {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
					runtime = {
						version = 'LuaJIT'
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
						}
					}
				})
			end,
			settings = {
				Lua = {}
			}
		}

		require("lint").linters_by_ft = {
			markdown = { 'vale' },
			-- lua = {'luacheck'},
		}
	end
}
