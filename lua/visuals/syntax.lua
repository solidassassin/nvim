local g = vim.g

require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
	autopairs = {
		enable = true
	}
}

require "nvim-autopairs".setup {
	check_ts = true;
}

g.indent_blankline_char = '│'
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true
