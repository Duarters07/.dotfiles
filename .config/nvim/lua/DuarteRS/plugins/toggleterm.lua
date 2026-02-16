local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

-- ToggleTerm non terminal mode keybinds
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>")
vim.keymap.set("n", "<leader>vl", "<cmd>ToggleTermCurrentLine<CR>")
vim.keymap.set("n", "<leader>vv", "<cmd>ToggleTermVisualLines<CR>")
vim.keymap.set("n", "<leader>vs", "<cmd>ToggleTermVisualSelection<CR>")

-- ToggleTerm terminal mode keybinds
vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
