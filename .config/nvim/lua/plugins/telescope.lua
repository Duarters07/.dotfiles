local builtin = require('telescope.builtin')


vim.api.nvim_set_keymap('n', '<leader>ff', ":Telescope find_files<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>fg', ":Telescope live_grep<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>fb', ":Telescope buffers<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>fh', ":Telescope help_tags<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>fp', ":Telescope planets<CR>", {})
vim.api.nvim_set_keymap('n', '<leader>gc', ":Telescope git_commits<CR>", { noremap = true, silent = true })

