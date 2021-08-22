-- Just some insignificant plugin initialization

local g = vim.g

require "lsp-rooter".setup {}
require "presence":setup {
    main_image = "file"
}

g.nvim_tree_auto_open = 1
g.nvim_tree_update_cwd = 1
g.nvim_tree_auto_close = 1

require "formatter".setup {
    logging = false,
    filetype = {
        python = {
            function()
                return {
                    exe = "python",
                    args = {"-m", "black", vim.api.nvim_buf_get_name}
                }
            end
        },
        lua = {
            function()
                return {
                    exe = "luafmt",
                    args = {"--indent-count", 4, "--stdin"},
                    stdin = true
                }
            end
        }
    }
}
