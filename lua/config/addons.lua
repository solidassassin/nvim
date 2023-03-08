local M = {}

M.project = {}

M.nvim_tree = {
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

M.barbar = {}

M.presence = {
    main_image = "file"
}

return M
