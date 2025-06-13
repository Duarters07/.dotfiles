local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--exclude', '.git',
      '--exclude', '.git/**',
    },
  }
})

-- Atalhos com suporte a ficheiros ocultos e exclusão de .git
vim.keymap.set('n', '<leader>ff', function()
  builtin.find_files({
    hidden = true,
    find_command = {
      'fd', '--type', 'f',
      '--hidden',
      '--exclude', '.git'
    }
  })
end, { desc = '[F]ind [F]iles (incl. hidden, ignora .git)' })

vim.keymap.set('n', '<leader>fg', function()
  builtin.live_grep({ hidden = true })
end, { desc = '[F]ind by [G]rep (incl. hidden, ignora .git)' })

vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp tags' })
vim.keymap.set('n', '<leader>fp', builtin.planets, { desc = '[F]ind [P]lanets' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
