----------------------------
--- Plugin para explorer ---
----------------------------


-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

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
        side = 'right',              -- Posição da Tree
        relativenumber = true,
        preserve_window_proportions = true,
    },

    renderer = {
        group_empty = true,
        highlight_opened_files = "all",
        full_name = true,
        indent_markers = {
            enable = true,
        },
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = "",     -- arrow when folder is closed
                    arrow_open = "",       -- arrow when folder is open
                }
            }
        }
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
            quit_on_open = true,   -- Fecha automanticamente a Tree
            window_picker = {
                enable = false,
            }
        },
    },
})


--vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Open File Explorer"})
vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeFocus<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
