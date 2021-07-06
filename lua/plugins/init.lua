local function update_mkdp()
	vim.call[[mkdp#util#install]]
end

require "paq" {
    "savq/paq-nvim";
    --Dependencies
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    "kyazdani42/nvim-web-devicons";
    "L3MON4D3/LuaSnip"; -- incomplete
    -- Lsp
    "neovim/nvim-lspconfig";
    "hrsh7th/nvim-compe";
    "glepnir/lspsaga.nvim";
    -- Telescope
    "nvim-telescope/telescope.nvim";
    -- Helpers
    "windwp/nvim-autopairs";
    "folke/which-key.nvim";
    "kyazdani42/nvim-tree.lua";
	"ahmedkhalf/lsp-rooter.nvim";
	"andweeb/presence.nvim";
    -- Looks
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" };
    "lukas-reineke/indent-blankline.nvim";
    "hoob3rt/lualine.nvim";
    "akinsho/nvim-bufferline.lua";
    "lewis6991/gitsigns.nvim";
    "onsails/lspkind-nvim"; -- incomplete
    "folke/trouble.nvim";
    "marko-cerovac/material.nvim";
    -- Language specific
    "JuliaEditorSupport/julia-vim";
	{ "iamcco/markdown-preview.nvim", run = update_mkdp };
}

require "plugins.misc"
