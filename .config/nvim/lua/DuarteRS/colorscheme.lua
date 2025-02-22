
------------------------------ color Scheme --------------------------------
--
vim.cmd[[colorscheme dracula]]
--vim.cmd("colorscheme tokyonight")
--vim.cmd("colorscheme PaperColor")
--vim.cmd("colorscheme onedark")
--vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme kanagawa")
--vim.cmd.colorscheme "catppuccin"


--------------------- Para aplicar transparência --------------------------------

if vim.fn.has("nvim") == 1 then -- Transparent background. Only for nvim
    vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
end

