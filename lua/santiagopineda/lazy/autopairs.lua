return {
	{
		"windwp/nvim-autopairs",

		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt" },
				enable_check_bracket_line = true,
				ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = false,

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
