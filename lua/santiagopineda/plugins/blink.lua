return {
	"saghen/blink.cmp",

	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		{
			"folke/lazydev.nvim",
			dependencies = {
				{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
			},
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
	},

	version = "*",

	opts = {
		sources = {
			default = { "lsp", "path", "buffer", "snippets", "lazydev" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
			per_filetype = {
				codecompanion = { "codecompanion" },
			},
		},
		keymap = {
			preset = "default",
			-- ["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "accept", "fallback" },
		},
		snippets = {
			preset = "luasnip",
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
		cmdline = {
			enabled = false,
		},
	},
}
