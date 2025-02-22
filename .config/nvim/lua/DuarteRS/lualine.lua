require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {"NvimTree", "toggleterm", "Trouble"},
            winbar = {"NvimTree", "toggleterm", "Trouble"},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 10,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'fileformat', 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', 'aerial' },
        lualine_x = { 'filesize', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'selectioncount', 'location' }
    },
    inactive_sections = {
        lualine_a = { 'fileformat', 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', 'aerial' },
        lualine_x = { 'filesize', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'selectioncount', 'location' }
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
