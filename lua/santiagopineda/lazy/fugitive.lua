return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		vim.keymap.set("n", "<leader>gps", ":Git push<CR>")
		vim.keymap.set("n", "<leader>gpl", ":Git pull<CR>")
		vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>")
		vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>")
		vim.keymap.set("n", "<leader>gl", ":diffget //3<CR>")
	end,
}
