return {
	{
		"folke/trouble.nvim",
		enabled = true,
		lazy = false,
		cmd = "Trouble",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local trouble = require("trouble")
			trouble.setup({
				win = {
					position = "right",
					size = { width = 45 },
				},
			})

			vim.keymap.set("n", "<leader>tt", function()
				trouble.toggle("diagnostics")
			end)
		end,
	},
}
