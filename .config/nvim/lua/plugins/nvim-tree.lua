-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    -- Desabilitar a exibição de arquivos vazios (se desejar)
    update_focused_file = {
        enable = true,
        update_cwd = true,  -- Atualiza o diretório de trabalho ao mudar de arquivo
    },

    sort = {
        sorter = "case_sensitive",
    },

    view = {
        width = 30,                 -- Largura da tree
        side = 'left',              -- Posição da Tree
        preserve_window_proportions = true,
    },

    renderer = {
        group_empty = true,
        highlight_opened_files = "all",
        full_name = true,
    },

    filters = {
        dotfiles = false,            -- false para exibir arquivos ocultos
    },

    git = {
        enable = true,              -- Exibe Status do Git
        ignore = false,             -- Exibe arquivos ocultos pelo Git
    },

    actions = {
        open_file = {
            quit_on_open = false,   -- Fecha automanticamente a Tree
        },
    },
})


vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>")
