require("trouble").setup {
    position = "bottom",
    auto_open = true,
    auto_close = false,
    auto_preview = false,
    icons = true,
}

-- Keybindings
vim.keymap.set("n", "<leader>x", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap = true, silent = true })
vim.keymap.set("n", ")", function ()
    require("trouble").next({ skip_groups = true, jump = true })
end, { noremap = true, silent = true })
vim.keymap.set("n", "(", function ()
    require("trouble").previous({ skip_groups = true, jump = true })
end, { noremap = true, silent = true })
