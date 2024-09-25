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
			trouble.setup()

			vim.keymap.set("n", "<leader>tt", function()
				trouble.toggle("diagnostics")
				trouble.toggle_preview()
			end)

			vim.keymap.set("n", "[t", function()
				trouble.next({ skip_groups = true, jump = true }, {})
			end)

			vim.keymap.set("n", "]t", function()
				trouble.previous({ skip_groups = true, jump = true })
			end)
		end,
	},
}
