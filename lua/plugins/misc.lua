-- Just some insignificant plugin initialization

local g = vim.g

require "lsp-rooter".setup {}
require "presence":setup {
    main_image = "file"
}

g.nvim_tree_auto_open = 1
g.nvim_tree_update_cwd = 1
g.nvim_tree_auto_close = 1

local get_name = vim.api.nvim_buf_get_name

require "formatter".setup {
    logging = false,
    filetype = {
        python = {
            function()
                return {
                    exe = "python",
                    args = {"-m", "black", get_name(0)},
                    stdin = false
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
        },
        yaml = {
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.fn.fnameescape(get_name(0)), "--single-quote"},
                    stdin = true
                }
            end
        }
    }
}
