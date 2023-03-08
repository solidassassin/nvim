local icons = {
    hint = "",
    info = "",
    warning = "▲",
    error = "🗙"
}

local M = {}

M.treesitter = {
    config = {
        playground = {
            enable = true
        },
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
    },
    parsers = {
        gotmpl = {
            install_info = {
                url = "https://github.com/ngalaiko/tree-sitter-go-template",
                files = {"src/parser.c"}
            },
            filetype = "gotmpl",
            used_by = {"gohtmltmpl", "gotexttmpl", "gotmpl", "yaml"}
        }
    }
}

M.lualine = {
    options = {
        theme = "auto"
    },
    sections = {
        lualine_b = {
            "branch",
            "diff",
            {
                "diagnostics",
                sources = {"nvim_lsp"},
                symbols = {
                    error = icons.error,
                    warn = icons.warning,
                    info = icons.info,
                    hint = icons.hint
                }
            }
        }
    }
}

M.lspsaga = {
    error_sign = icons.error,
    warn_sign = icons.warning,
    hint_sign = icons.hint
}

M.material_theme = {
    contrast = {
        terminal = true,
        sidebars = true,
        floating_windows = true,
        cursor_line = true,
        non_current_windows = true,
    },

    styles = {
        comments = { italic = true },
        keywords = { italic = true },
        loops = { italic = true }
    },

    plugins = {
        "dap",
        "gitsigns",
        -- "hop",
        "indent-blankline",
        "lspsaga",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
        "trouble",
        "which-key",
    },

    lualine_style = "stealth",
    custom_colors = function (colors)
        colors.syntax.field = "#8792C9"
        colors.syntax.type = "#FFCB6B"
    end
}

M.indent_blankline = {
    show_current_context = true,
    show_current_context_start = true,
}

return M
