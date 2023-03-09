local tb = require("utils.tables")

local lsp = require("config.lsp")
local nvim = require("config.nvim")
local addons = require("config.addons")
local visuals = require("config.visuals")

local M = {}

local function load_plugins(opts)
    require("lazy").setup({
        {
            "neovim/nvim-lspconfig",
            config = function ()
                lsp.load_lspconfig(opts.lspconfig)
            end
        },
        {
            "jose-elias-alvarez/null-ls.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            config = function ()
                lsp.load_nulls(opts.null_ls)
            end
        },
        {
            "williamboman/mason.nvim",
            config = function ()
                lsp.load_mason(opts.mason)
            end
        },
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                "neovim/nvim-lspconfig",
                "williamboman/mason.nvim"
            },
            config = function ()
                lsp.load_mason_lspconfig(opts.mason_lspconfig)
            end
        },
        {
            "jay-babu/mason-null-ls.nvim",
            dependencies = {
                "jose-elias-alvarez/null-ls.nvim",
                "williamboman/mason.nvim"
            },
            config = function ()
                lsp.load_mason_nulls(opts.mason_null_ls)
            end
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "onsails/lspkind-nvim",
                {
                    "saadparwaiz1/cmp_luasnip",
                    dependencies = "L3MON4D3/LuaSnip"
                }
            },
            config = function ()
                lsp.load_cmp(opts.cmp)
            end
        },
        {
            "L3MON4D3/LuaSnip",
            dependencies = {
                "hrsh7th/nvim-cmp",
                "rafamadriz/friendly-snippets"
            },
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        },
        {
            "numToStr/Comment.nvim",
            config = true
        },
        {
            "windwp/nvim-autopairs",
            config = true
        },
        --"folke/which-key.nvim",

        {
            "nvim-tree/nvim-tree.lua",
            config = function ()
                addons.load_nvimtree(opts.nvim_tree)
            end
        },
        {
            "ahmedkhalf/project.nvim",
            config = function ()
                addons.load_project(opts.project)
            end
        },
        {
            "andweeb/presence.nvim",
            config = function ()
                addons.load_presence(opts.presence)
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function ()
                visuals.load_treesitter(opts.treesitter)
            end
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            config = function ()
                visuals.load_indent_blankline(opts.indent_blankline)
            end
        },
        {
            "hoob3rt/lualine.nvim",
            config = function ()
                visuals.load_lualine(opts.lualine)
            end
        },
        {
            "akinsho/bufferline.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = true
        },
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            dependencies = "nvim-lua/plenary.nvim",
            config = true
        },
        {
            "glepnir/lspsaga.nvim",
            event = "BufRead",
            dependencies = {
              "nvim-tree/nvim-web-devicons",
              "nvim-treesitter/nvim-treesitter"
            },
            config = function ()
                visuals.load_lspsaga(opts.lspsaga)
            end
        },
        {
            "lewis6991/gitsigns.nvim",
            config = true
        },
        {
            "folke/trouble.nvim",
            config = true
        },
        {
            "marko-cerovac/material.nvim",
            config = function ()
                visuals.load_material_theme(opts.material_theme)
            end
        },
        {
            "stevearc/dressing.nvim",
            config = true
        },
        {
            "iamcco/markdown-preview.nvim",
            build = function ()
                vim.fn["mkdp#util#install"]()
            end
        }
    }, {})
end

function M.setup(overrides)
    nvim.load_opts(overrides)
    nvim.load_globals(overrides)
    nvim.load_autocmds(overrides)
    load_plugins(overrides)
end

return M
