local M = {}

function M.set_opts(options)
    for a, b in pairs(options) do
        vim.opt[a] = b
    end
end

-- Which-keys used instead of this
function M.map(t)
    vim.api.nvim_set_keymap(
        t.mode or "n",
        t[1],
        t[2],
        {
            noremap = t.noremap == nil or t.noremap,
            silent = t.silent == nil or t.silent,
            nowait = t.nowait,
            unique = t.unique,
            script = t.script,
            expr = t.expr
        }
    )
end

-- I don't really use this, but might come in handy
function M.prequire(...)
    local status, lib = pcall(require, ...)
    if status then
        return lib
    end
    return nil
end

function M.terms(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.check_back_space()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- Not in use (language servers are loaded in mason hook instead)
function M.language_servers(langs, defaults)
    local lsp = require "lspconfig"

    for lang, conf in pairs(langs) do
        for a, b in pairs(defaults) do
            if conf[a] == nil then
                conf[a] = b
            end
        end
        lsp[lang].setup(conf)
    end
end

return M
