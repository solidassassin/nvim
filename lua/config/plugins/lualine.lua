return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        theme = "catppuccin",
        options = {
            component_separators = " ",
            section_separators = { left = "", right = "" },
        }
    }
}
