-- lua/plugins/colorschemes.lua

-- Aplicar temas

-- vim.cmd('colorscheme onedark')
-- vim.cmd('colorscheme nightfly')
-- vim.cmd('colorscheme catppuccin')
-- vim.cmd('colorscheme kanagawa')
-- vim.cmd('colorscheme vesper')


require("tokyonight").setup({
      style = "night",
      on_colors = function(colors)
        colors.bg = "#011628"
        colors.bg_dark = "#011423"
        colors.bg_float = "#011423"
        colors.bg_highlight = "#143652"
        colors.bg_popup = "#011423"
        colors.bg_search = "#0A64AC"
        colors.bg_sidebar = "#011423"
        colors.bg_statusline = "#011423"
        colors.bg_visual = "#275378"
        colors.fg = "#CBE0F0"
        colors.fg_dark = "#B4D0E9"
        colors.fg_float = "#CBE0F0"
        colors.fg_gutter = "#627E97"
        colors.fg_sidebar = "#B4D0E9"
        colors.border = "#547998"
      end,
    })

vim.cmd('colorscheme tokyonight')


if vim.fn.has("nvim") == 1 then -- Transparent background. Only for nvim
    vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
    vim.cmd("highlight EndOfBuffer guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
    vim.cmd("highlight SignColumn guibg=NONE ctermbg=NONE")
end
