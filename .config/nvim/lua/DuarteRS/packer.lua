local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)

    ------------------- Colorschemes -------------------------
    --use "folke/tokyonight.nvim"
    --use "NLKNguyen/papercolor-theme"
    --use "joshdick/onedark.vim"
    --use "ellisonleao/gruvbox.nvim"
    --use "rebelot/kanagawa.nvim"
    --use { "catppuccin/nvim", as = "catppuccin" }
    use 'Mofiqul/dracula.nvim'


    ---------------------- TagBar -----------------------------
    use 'liuchengxu/vista.vim'


    -------------- Auto save and Auto Close and Autopairs ------------------- 
    use "Pocco81/AutoSave.nvim"
    use 'm4xshen/autoclose.nvim'
    use  "windwp/nvim-autopairs"


    ---------------------- Notify -----------------------------
    use 'rcarriga/nvim-notify'


	--------------------- Treesitter --------------------------
	use "nvim-treesitter/nvim-treesitter"
    use "HiPhish/nvim-ts-rainbow2"
    use"nvim-treesitter/nvim-treesitter-context"


	--------------------- Telescope ---------------------------
	use {'nvim-telescope/telescope.nvim', tag = '0.1.5'}
    use  "nvim-lua/plenary.nvim"


    ---------------------- Barbat -----------------------------
    use 'lewis6991/gitsigns.nvim'
    use 'romgrk/barbar.nvim'


    -------------------- Toggleterm ---------------------------
    use "akinsho/toggleterm.nvim"


    -------------------- Nerd Tree ---------------------------
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'


    --------------------- Lua-line ---------------------------
    use 'nvim-lualine/lualine.nvim'


    ------------------- indent-blankline ---------------------
    use "lukas-reineke/indent-blankline.nvim"


    ----------------------- Comments -------------------------
    use 'numToStr/Comment.nvim'







    use  "wbthomason/packer.nvim"  -- Have packer manage itself
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "folke/trouble.nvim"
    use "ahmedkhalf/project.nvim"
    use "lewis6991/impatient.nvim"
    use "goolord/alpha-nvim"
    use "folke/which-key.nvim"
	-- Cmp (completions)
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
