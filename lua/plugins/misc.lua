-- Just some insignificant plugin initialization

local g = vim.g

require "lsp-rooter".setup {}
require "presence":setup {
    main_image = "file"
}

require "nvim-tree".setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    lsp_diagnostics = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    view = {
        width = 30,
        height = 30,
        side = "left",
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {}
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
        markdown = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(get_name(0)),
                        "--single-quote",
                        "--prose-wrap always"
                    },
                    stdin = true
                }
            end
        }
    }
}
