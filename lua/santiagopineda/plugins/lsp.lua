return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"saghen/blink.cmp",

				dependencies = { "rafamadriz/friendly-snippets", "Kaiser-Yang/blink-cmp-avante" },

				version = "*",

				opts = {
					sources = {
						default = { "avante", "lsp", "path", "buffer" },
						providers = {
							avante = {
								module = "blink-cmp-avante",
								name = "Avante",
							},
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
					"html",
					"cssls",
					"emmet_language_server",
					"jsonls",
					"pyright",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						vim.lsp.config(server_name, config)
					end,
				},
			})

			vim.lsp.config(
				"lua_ls",
				vim.tbl_extend("force", config, {
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
				})
			)

			vim.lsp.config(
				"emmet_language_server",
				vim.tbl_extend("force", config, {
					manual_install = true,
					filetypes = { "typescriptreact", "javascriptreact", "html", "css" },
				})
			)

			vim.lsp.config("gleam", config)

			vim.lsp.config(
				"ocamllsp",
				vim.tbl_extend("force", config, {
					manual_install = true,
					cmd = { "dune", "tools", "exec", "ocamllsp" },
					settings = {
						codelens = { enable = true },
						inlayHint = { enable = true },
						syntaxDocumentation = { enable = true },
					},
				})
			)

			vim.lsp.config(
				"ruff",
				vim.tbl_extend("force", config, {
					manual_install = true,
					cmd = { "ruff", "server" },
					root_dir = function(fname)
						return vim.fn.getcwd()
					end,
				})
			)
		end,
	},
}
