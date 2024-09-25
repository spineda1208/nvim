return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "c", "python", "javascript", "lua", "bash", "gleam" },
				modules = {},

				sync_install = true,
				auto_install = true,

				ignore_install = {},

				highlight = {
					enable = true,
					disable = { "latex" },
					additional_vim_regex_highlighting = { "markdown" },
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
					},
					-- swap = {
					-- 	enable = true,
					-- 	swap_next = {
					-- 		["<leader>sa"] = "@parameter.inner",
					-- 	},
					-- 	swap_prev = {
					-- 		["<leader>sA"] = "@parameter.inner",
					-- 	},
					-- },
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,

		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = { ["html"] = { enable_close = false } },
			})
		end,
	},
}
