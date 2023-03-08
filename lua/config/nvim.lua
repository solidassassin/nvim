local M = {}
local HOME = os.getenv("HOME")

M.opts = {
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

M.globals = {
    material_style = "deep ocean",
    --indent_blankline_char = "│",
    --indent_blankline_use_treesitter = true,
    --indent_blankline_show_current_context = true,
    loaded_netrw = 1,
    loaded_netrwPlugin = 1
}

M.autocmds = {
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

return M
