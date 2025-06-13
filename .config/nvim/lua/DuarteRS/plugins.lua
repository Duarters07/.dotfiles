
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
        { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)



-- Carregar o Lazy.nvim
require('lazy').setup({

    -- Colorscheme
    { 
        'folke/tokyonight.nvim',
        'joshdick/onedark.vim',
        'bluz71/vim-nightfly-colors',
	    'catppuccin/nvim',
        'rebelot/kanagawa.nvim',
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim',
    },


    -- LuaLine
    {
        'nvim-lualine/lualine.nvim',
        'kyazdani42/nvim-web-devicons',
    },


    -- Nvim Tree
    {
        'nvim-tree/nvim-tree.lua',
        'nvim-tree/nvim-web-devicons',
    },


    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        'moll/vim-bbye',
    },


    -- Which-Key
    {
        'folke/which-key.nvim',
    },


    -- Auto save and Auto Close and Autopairs
    {
        'Pocco81/AutoSave.nvim',
        'm4xshen/autoclose.nvim',
        'windwp/nvim-autopairs',
    },


    -- LSP
    {
        'neovim/nvim-lspconfig',
        {'williamboman/mason.nvim', config = true},
        {'williamboman/mason-lspconfig.nvim', config = true},
    },


    -- Cmp (completions)
    {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-nvim-lua',
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },


    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        'HiPhish/rainbow-delimiters.nvim',
        'nvim-treesitter/nvim-treesitter-context',
    },

    -- Trouble
    {
        'folke/trouble.nvim',
    },


    -- Barbar
    {
        'romgrk/barbar.nvim',
    },


    {
        'git@github.com:lewis6991/gitsigns.nvim.git',
    },
})

