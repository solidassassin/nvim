local function install_lazy()
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    end

    vim.opt.rtp:prepend(lazypath)
end

local table_utils = require("utils.tables")
local config = require("config")

local M = {}

local function fetch_os_config(conf)
    local os_table = {
        Linux = conf.linux,
        OSX = conf.mac,
        Windows = conf.windows
    }

    return os_table[jit.os]
end

function M.setup(conf)
    local merged_config = table_utils.recursive_merge(
        conf.common,
        fetch_os_config(conf)
    )

    install_lazy()
    config.setup(merged_config)
end

return M
