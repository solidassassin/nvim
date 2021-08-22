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
    check_ts = true
}

vim.cmd [[
    augroup theming
        au!
        au CursorMoved *.{yaml,yml} :hi TSField guifg=#f56278
        au CursorMoved *{.yaml,.yml}\@<! :hi TSField guifg=g:material_variable_color
    augroup END
]]

g.indent_blankline_char = "│"
g.indent_blankline_use_treesitter = true
g.indent_blankline_show_current_context = true
