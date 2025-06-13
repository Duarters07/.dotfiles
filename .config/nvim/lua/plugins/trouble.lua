require("trouble").setup {
    position = "bottom",
    modes = {
        diagnostics = {
            auto_open = true,
            auto_close = false,
            auto_preview = false
        },
    },
}

-- Keybindings
vim.keymap.set("n", "<leader>x", "<cmd>Trouble diagnostics<cr>", { noremap = true, silent = true })
vim.keymap.set("n", ")", function()
    require("trouble").next({ skip_groups = true, jump = true })
end, { noremap = true, silent = true })
vim.keymap.set("n", "(", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end, { noremap = true, silent = true })
