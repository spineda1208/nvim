return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.6",

	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require("telescope").setup({})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
		vim.keymap.set("n", "<leader>pwf", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pWf", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>pf", function()
			-- builtin.grep_string({ search = vim.fn.input("> ") })
			builtin.live_grep()
		end)
	end,
}
