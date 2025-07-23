vim.api.nvim_create_autocmd('FileType', {
    pattern = 'cmp_docs',
    callback = function()
        vim.treesitter.start(0, 'markdown')
    end,
})

local treesitter_setup = {
    sync_install = false,
    auto_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    ensure_installed = {
        "asm",
        "awk",
        "bash",
        "c",
        "c_sharp",
        "comment",
        "cpp",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "fish",
        "git_config",
        "gitattributes",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "graphql",
        "hcl",
        "helm",
        "html",
        "ini",
        "java",
        "javascript",
        "json",
        "julia",
        "just",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "nix",
        "python",
        "regex",
        "rust",
        "terraform",
        "typescript",
        "vim",
        "yaml",
        "zig"
    }
}

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup(treesitter_setup)
    end
}