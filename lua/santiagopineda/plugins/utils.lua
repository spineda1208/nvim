return {
	"tpope/vim-surround",
	"christoomey/vim-tmux-navigator",
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"tpope/vim-commentary",
		config = function()
			vim.cmd([[autocmd FileType gleam setlocal commentstring=//\ %s]])
		end,
	},
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_quickfix_open_on_warning = 0
		end,
	},
	{
		"eandrju/cellular-automaton.nvim",
		config = function()
			vim.keymap.set("n", "<leader>FUCK", "<cmd>CellularAutomaton make_it_rain<cr>")
		end,
	},
}
