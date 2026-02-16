
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
        'datsfilipe/vesper.nvim',
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
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'whoIsSethDaniel/mason-tool-installer.nvim',
    },


    -- Cmp (completions)
    {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-nvim-lua',
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
    },


    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        'HiPhish/rainbow-delimiters.nvim',
        'nvim-treesitter/nvim-treesitter-context',
        'windwp/nvim-ts-autotag',
    },

    -- Trouble
    {
        'folke/trouble.nvim',
        'folke/todo-comments.nvim',
    },


    -- Barbar
    {
        'romgrk/barbar.nvim',
    },


    -- gitsigns
    {
        'git@github.com:lewis6991/gitsigns.nvim.git',
    },

    
    -- Toggleterm
    {
        'akinsho/toggleterm.nvim',
    },


    -- Notify
    {
        'rcarriga/nvim-notify',
        lazy = false, -- garante que o plugin é carregado imediatamente
        priority = 1000, -- opcional, para garantir que vem cedo
    },


    -- Alpha
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
    },

    -- dressing
    { 
        "stevearc/dressing.nvim", 
        event = "VeryLazy",
    },



    -- comments
    {
        'numToStr/Comment.nvim',
        'JoosepAlviste/nvim-ts-context-commentstring',
    },

    -- surround
    {
        'kylechui/nvim-surround',
        config = true,
    },

    -- formatting
    {
        'stevearc/conform.nvim'
    },
})

