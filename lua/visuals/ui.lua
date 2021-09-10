local g = vim.g

require "material".setup {
    contrast = true,
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

g.material_style = "deep ocean"
vim.cmd [[colorscheme material]]

require "gitsigns".setup {
    keymaps = {}
}

require "trouble".setup {}

require "lualine".setup {
    options = {
        theme = "material-nvim"
    }
}

require "lspsaga".init_lsp_saga {
    error_sign = "🗙",
    warn_sign = "▲",
    hint_sign = ""
}

require "bufferline".setup {
    options = {
        view = "default",
        numbers = function(opts)
            return opts.id .. "."
        end,
        buffer_close_icon = "",
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
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
