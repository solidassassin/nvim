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
    undodir = HOME .. "/.config/nvim/.cache/undo",
    backupdir = HOME .. "/.config/nvim/.cache/backups",
    completeopt = "menuone,noselect",
    updatetime = 500,
    showmode = false,
    timeoutlen = 500,
    shortmess = "c",
    wrap = false
}

require "which-key".register(keys.general_keys)
