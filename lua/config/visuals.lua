local tb = require("utils.tables")
local icons = {
    hint = "",
    info = "",
    warn = "▲",
    error = "🗙"
}

local M = {}

function M.load_treesitter(opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    local config = {
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

    -- Hackz
    if opts == nil then
        opts = {}
    end

    require("nvim-treesitter.configs").setup(tb.merge(config.config, opts.config))

    for key, value in pairs(tb.merge(config.parsers, opts.parsers)) do
       parser_config[key] = value
    end
end

function M.load_lualine(opts)
    local config = {
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
                    symbols = icons
                }
            }
        }
    }
    require("lualine").setup(tb.merge(config, opts))
end

function M.load_lspsaga(opts)
    local config = {
        error_sign = icons.error,
        warn_sign = icons.warn,
        hint_sign = icons.hint
    }
    require("lspsaga").setup(tb.merge(config, opts))
end

function M.load_material_theme(opts)
    local config = {
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
    require("material").setup(tb.merge(config, opts))
    vim.cmd("colorscheme material")
end

function M.load_indent_blankline(opts)
    local config = {
        show_current_context = true,
        show_current_context_start = true,
        use_treesitter = true
    }
    require("indent_blankline").setup(tb.merge(config, opts))
end

return M
