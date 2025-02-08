return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"saghen/blink.cmp",

				dependencies = "rafamadriz/friendly-snippets",

				version = "*",

				opts = {
					keymap = {
						preset = "default",
						["<CR>"] = { "accept", "fallback" },
					},
					appearance = {
						use_nvim_cmp_as_default = true,
						nerd_font_variant = "mono",
					},
					signature = { enabled = true },
				},
			},

			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
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
			"L3MON4D3/LuaSnip",
			"artemave/workspace-diagnostics.nvim",
		},

		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local config = {
				capabilities = capabilities,
				autostart = true,
				on_attach = function(client, bufnr)
					require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
				end,
			}

			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = false,
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"pyright",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup(config)
					end,
				},
			})

			require("lspconfig").lua_ls.setup(vim.tbl_extend("force", config, {
				settings = {
					Lua = {
						runtime = { version = "Lua 5.1" },
						diagnostics = {
							globals = {
								"bit",
								"vim",
								"it",
								"describe",
								"before_each",
								"after_each",
							},
						},
					},
				},
			}))

			require("lspconfig").gleam.setup(config)

			require("lspconfig").ocamllsp.setup(vim.tbl_extend("force", config, {
				manual_install = true,
				cmd = { "dune", "tools", "exec", "ocamllsp" },
				capabilities = capabilities,
				settings = {
					codelens = { enable = true },
					inlayHint = { enable = true },
					syntaxDocumentation = { enable = true },
				},
			}))

			require("lspconfig").ruff.setup(vim.tbl_extend("force", config, {
				manual_install = true,
				cmd = { "ruff", "server" },
				capabilities = capabilities,
				root_dir = function(fname)
					return vim.fn.getcwd()
				end,
			}))
		end,
	},
}
