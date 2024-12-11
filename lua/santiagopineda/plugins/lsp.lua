return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
			"artemave/workspace-diagnostics.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)
			local universal_lsp_config = {
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
				end,
			}

			require("fidget").setup({})
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"pyright",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup(universal_lsp_config)
					end,

					["lua_ls"] = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
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
					end,
				},
			})
			require("lspconfig").gleam.setup(universal_lsp_config)

			require("lspconfig").ocamllsp.setup(vim.tbl_extend("force", universal_lsp_config, {
				manual_install = true,
				cmd = { "dune", "tools", "exec", "ocamllsp" },
				capabilities = capabilities,
				settings = {
					codelens = { enable = true },
					inlayHint = { enable = true },
					syntaxDocumentation = { enable = true },
				},
			}))

			require("lspconfig").ruff.setup(vim.tbl_extend("force", universal_lsp_config, {
				manual_install = true,
				cmd = { "ruff", "server" },
				capabilities = capabilities,
				root_dir = function(fname)
					return vim.fn.getcwd()
				end,
			}))

			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "luasnip" },
				}, { { name = "buffer" } }),
				-- formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{ -- optional completion source for require statements and module annotations
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
	},
	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
