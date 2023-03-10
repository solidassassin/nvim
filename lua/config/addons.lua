local tb = require("utils.tables")
local M = {}

function M.load_project(opts)
    local config = {}
    require("project_nvim").setup(tb.merge(config, opts))
end

-- Not done
function M.load_nvimtree(opts)
    local config = {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
        enable = true,
        update_root = true
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
    require("nvim-tree").setup(tb.merge(config, opts))
end

function M.load_presence(opts)
    local config = {
        main_image = "file"
    }
    require("presence").setup(tb.merge(config, opts))
end

return M
