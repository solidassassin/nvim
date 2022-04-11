local constants = require "general.constants"

require "material".setup {
    contrast = {
		sidebars = true,
		floating_windows = false,
		line_numbers = false,
		sign_column = false,
		cursor_line = true,
		non_current_windows = false,
		popup_menu = false
	},
    italics = {
        comments = true,
        keywords = false,
        functions = false,
        strings = false,
        variables = false
    },
    text_contrast = {
        lighter = false,
        darker = false
    },
    disable = {
        background = false,
        term_colors = false,
        eob_lines = true
    },
    custom_colors = {
        variable = "#8b8ca3",
        field = "#717CB4"
    }
}

vim.g.material_style = "deep ocean"
vim.cmd [[colorscheme material]]

require "gitsigns".setup {
    keymaps = {}
}

require "trouble".setup {}

local icons = constants.icons

require "lualine".setup {
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

require "lspsaga".init_lsp_saga {
    error_sign = icons.error,
    warn_sign = icons.warning,
    hint_sign = icons.hint
}

require "bufferline".setup {
    options = {
        view = "default",
        numbers = function(opts)
            return opts.id .. "."
        end,
        buffer_close_icon = icons.close,
        modified_icon = icons.modified,
        left_trunc_marker = icons.left,
        right_trunc_marker = icons.right,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 20,
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        sort_by = "extension"
    }
}
