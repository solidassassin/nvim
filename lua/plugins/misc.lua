require "lsp-rooter".setup {}
require "Comment".setup()
require "nvim-autopairs".setup {}
require "presence":setup {
    main_image = "file"
}

require "nvim-tree".setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    renderer = {
        highlight_git = true,
        indent_markers = {
            enable = true
        }
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "▲",
            error = "🗙"
        }
    }
}

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
        },
        json = {
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.fn.fnameescape(get_name(0))},
                    stdin = true
                }
            end
        },
        markdown = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(get_name(0)),
                        "--prose-wrap always"
                    },
                    stdin = true
                }
            end
        }
    }
}
