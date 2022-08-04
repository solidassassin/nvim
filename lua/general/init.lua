local utils = require "general.helpers"
local keys = require "general.mappings"

local HOME = os.getenv("HOME")

utils.set_opts {
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

vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern = {"terraform"},
        callback = function ()
            vim.opt.ts = 2
            vim.opt.sw = 2
        end
    }
)

-- Hack for syntax highlighting in Helm
vim.api.nvim_create_autocmd(
    {"BufNewFile", "BufRead"},
    {
        pattern = {"*.gotmpl", "*.tpl", "*/templates/*.yaml", "*/templates/*.yml"},
        callback = function ()
            vim.opt_local.filetype = "gotmpl"
        end
    }
)

require "which-key".register(keys.general_keys)
