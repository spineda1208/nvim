return {
	"tpope/vim-surround",
	"christoomey/vim-tmux-navigator",
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
			vim.keymap.set("n", "<leader>gps", ":Git push<CR>")
			vim.keymap.set("n", "<leader>gpl", ":Git pull<CR>")
			vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>")
			vim.keymap.set("n", "<leader>gh", ":diffget //2<CR>")
			vim.keymap.set("n", "<leader>gl", ":diffget //3<CR>")
		end,
	},
	{
		"tpope/vim-commentary",
		config = function()
			vim.cmd([[autocmd FileType gleam setlocal commentstring=//\ %s]])
		end,
	},
	{
		"ThePrimeagen/vim-apm",
		config = function()
			local apm = require("vim-apm")

			apm:setup({})
			vim.keymap.set("n", "<leader>apm", function()
				apm:toggle_monitor()
			end)
		end,
	},
	{
		"eandrju/cellular-automaton.nvim",
		config = function()
			vim.keymap.set("n", "<leader>FUCK", "<cmd>CellularAutomaton make_it_rain<cr>")
		end,
	},
	{
		"glacambre/firenvim",

		lazy = not vim.g.started_by_firenvim,
		build = function()
			vim.fn["firenvim#install"](0)
		end,
	},
}
