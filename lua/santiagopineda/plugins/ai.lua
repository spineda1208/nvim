return {
	"olimorris/codecompanion.nvim",
	config = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		strategies = {
			chat = {
				keymaps = {
					send = {
						modes = {
							n = "<C-s>",
							i = "<C-s>",
						},
					},
					close = {
						modes = {
							n = "<C-q>",
							i = "<C-q>",
						},
					},
				},
				adapter = "anthropic",
			},
			inline = {
				adapter = "gemini",
			},
		},

		display = {
			chat = {
				window = {
					layout = "vertical",
					position = "right",
					width = 0.25,
					full_height = true,
				},
			},
		},
	},
}
