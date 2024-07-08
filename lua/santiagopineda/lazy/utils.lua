return {
	"tpope/vim-surround",
	"christoomey/vim-tmux-navigator",
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
		"tpope/vim-commentary",
		config = function()
			vim.cmd([[autocmd FileType gleam setlocal commentstring=//\ %s]])
		end,
	},
}
