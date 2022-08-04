local g = vim.g

require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.gotmpl = {
    install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = {"src/parser.c"}
    },
    filetype = "gotmpl",
    used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
}

g.indent_blankline_char = "│"
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true
