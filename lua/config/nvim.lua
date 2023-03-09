local tb = require("utils.tables")
local HOME = os.getenv("HOME")

local M = {}

function M.load_opts(opts)
    local config = {
        mouse = "a",
        ts = 4,
        sw = 4,
        expandtab = true,
        clipboard = "unnamedplus",
        inccommand = "split",
        number = true,
        relativenumber = true,
        termguicolors = true,
        ignorecase = true,
        smartcase = true,
        undofile = true,
        undodir = HOME .. "/.cache/nvim/undo",
        backupdir = HOME .. "/.cache/nvim/backups",
        completeopt = "menuone,noselect",
        updatetime = 500,
        showmode = false,
        timeoutlen = 500,
        shortmess = "c",
        wrap = false
    }
    for key, value in pairs(tb.merge(config, opts)) do
        vim.opt[key] = value
    end
end

function M.load_globals(opts)
    local config = {
        material_style = "deep ocean",
        loaded_netrw = 1,
        loaded_netrwPlugin = 1
    }
    for key, value in pairs(tb.merge(config, opts)) do
        vim.g[key] = value
    end
end

function M.load_autocmds(opts)
    local config = {
        {
            event = {"FileType"},
            pattern = {"terraform"},
            callback = function ()
                vim.opt_local.ts = 2
                vim.opt_local.sw = 2
            end
        },
        {
            event = {"BufNewFile", "BufRead"},
            pattern = {"*.gotmpl", "*.tpl", "*.tmpl", "*/templates/*.yaml", "*/templates/*.yml"},
            callback = function ()
                vim.opt_local.filetype = "gotmpl"
            end
        },
        {
            event = "BufEnter",
            group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
            callback = function()
                local layout = vim.api.nvim_call_function("winlayout", {})
                if layout[1] == "leaf" and vim.api.nvim_buf_get_option(
                    vim.api.nvim_win_get_buf(layout[2]), "filetype"
                ) == "NvimTree" and layout[3] == nil then vim.cmd("quit") end
            end
        }
    }

    for _, autocmd in ipairs(tb.concat(config, opts)) do
        vim.api.nvim_create_autocmd(
            autocmd.event,
            {
                pattern = autocmd.pattern,
                callback = autocmd.callback
            }
        )
    end
end

return M
