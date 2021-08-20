-- Just some insignificant plugin initialization

local g = vim.g

require "lsp-rooter".setup {}
require "presence":setup {
    main_image = "file";
}

g.nvim_tree_auto_open = 1
g.nvim_tree_update_cwd = 1
g.nvim_tree_auto_close = 1

