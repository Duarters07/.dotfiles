require("trouble").setup({
  position = "bottom",
  modes = {
    diagnostics = {
      auto_open = true,
      auto_close = false,
      auto_preview = false,
    },
  },
})

-- Keybindings
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Open/Close trouble list" })
vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle_preview<CR>", { desc = "Workspace diagnostics" })
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Open trouble quickfix" })
vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Open trouble loclist" })
--vim.keymap.set("n", "<leader>xt", "<cmd>Trouble todo toggle<CR>", { desc = "Open todos in trouble" })

-- vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics<cr>", { noremap = true, silent = true })
--vim.keymap.set("n", ")", function()
--    require("trouble").next({ skip_groups = true, jump = true })
--end, { noremap = true, silent = true })
--vim.keymap.set("n", "(", function()
--    require("trouble").previous({ skip_groups = true, jump = true })
--end, { noremap = true, silent = true })
