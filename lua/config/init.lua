local tb = require("utils.tables")
local loaders = require("utils.loaders")

local lsp = require("config.lsp")
local nvim = require("config.nvim")
local addons = require("config.addons")
local visuals = require("config.visuals")

local M = {}

local function load_opts(overrides)
    for key, value in pairs(tb.merge(nvim.opts, overrides.opts)) do
        vim.opt[key] = value
    end
    return overrides
end

local function load_globals(overrides)
    for key, value in pairs(tb.merge(nvim.globals, overrides.globals)) do
        vim.g[key] = value
    end
    return overrides
end

local function load_autocmds(overrides)
    for _, autocmd in ipairs(nvim.autocmds) do
        vim.api.nvim_create_autocmd(
            autocmd.event,
            {
                pattern = autocmd.pattern,
                callback = autocmd.callback
            }
        )
    end
end

local function load_plugins(overrides)
    require("lazy").setup({
        {
            "neovim/nvim-lspconfig",
            config = function ()
                loaders.lspconfig(
                    tb.merge(lsp.lspconfig, overrides.lspconfig)
                )
            end
        },
        {
            "jose-elias-alvarez/null-ls.nvim",
            opts = tb.merge(lsp.null_ls, overrides.null_ls),
            dependencies = "nvim-lua/plenary.nvim"
        },
        {
            "williamboman/mason.nvim",
            opts = tb.merge(lsp.mason, overrides.mason)
        },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = tb.merge(lsp.mason_lspconfig, overrides.mason_lspconfig),
            dependencies = {
                "neovim/nvim-lspconfig",
                "williamboman/mason.nvim"
            }
        },
        {
            "jay-babu/mason-null-ls.nvim",
            dependencies = {
                "jose-elias-alvarez/null-ls.nvim",
                "williamboman/mason.nvim"
            },
            config = function ()
                loaders.mason_null_ls(
                    tb.merge(lsp.mason_null_ls, overrides.mason_null_ls)
                )
            end
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "onsails/lspkind-nvim"
            },
            config = function ()
                local cmp = require("cmp")
                cmp.setup(lsp.cmp(cmp))
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
            opts = tb.merge(addons.nvim_tree, overrides.nvim_tree)
        }, -- done
        {
            "ahmedkhalf/project.nvim",
            config = function ()
                require("project_nvim").setup(
                    tb.merge(addons.project, overrides.project)
                )
            end
        }, -- done
        {
            "andweeb/presence.nvim",
            config = function ()
                require("presence"):setup(
                    tb.merge(addons.presence, overrides.presence)
                )
            end
        }, -- done
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function ()
                loaders.treesitter(
                    tb.merge(visuals.treesitter, overrides.treesitter)
                )
            end
        }, -- done
        {
            "lukas-reineke/indent-blankline.nvim",
            opts = tb.merge(visuals.indent_blankline, overrides.indent_blankline)
        }, -- done
        {
            "hoob3rt/lualine.nvim",
            opts = tb.merge(visuals.lualine, overrides.lualine)
        }, -- done
        {
            "akinsho/bufferline.nvim",
            dependencies = "nvim-tree/nvim-web-devicons",
            config = true
        },
        {
            "glepnir/lspsaga.nvim",
            event = "BufRead",
            opts = tb.merge(visuals.lspsaga, overrides.lspsaga),
            dependencies = {
              "nvim-tree/nvim-web-devicons",
              "nvim-treesitter/nvim-treesitter"
            }
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
                loaders.material_theme(
                    tb.merge(visuals.material_theme, overrides.material_theme)
                )
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
    load_opts(overrides)
    load_globals(overrides)
    load_plugins(overrides)
    load_autocmds(overrides)
end

return M
