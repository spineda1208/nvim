return {
	"sbdchd/neoformat",
	config = function()
		vim.g.neoformat_try_node_exe = 1
		vim.g.neoformat_enabled_python = { "ruff" }

		local oxfmt_definition = {
			exe = "oxfmt",
			args = { "--stdin-filepath", '"%:p"' },
			stdin = 1,
			try_node_exe = 1,
		}

		local js_filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }

		for _, ft in ipairs(js_filetypes) do
			vim.g["neoformat_" .. ft .. "_oxfmt"] = oxfmt_definition
		end

		local function detect_js_formatter()
			local root = vim.fn.getcwd()

			if vim.fn.filereadable(root .. "/node_modules/.bin/oxfmt") == 1 then
				return { "oxfmt" }
			end

			if vim.fn.filereadable(root .. "/node_modules/.bin/prettier") == 1 then
				return { "prettier" }
			end

			if vim.fn.filereadable(root .. "/node_modules/.bin/biome") == 1 then
				return { "biome" }
			end

			if vim.fn.filereadable(root .. "/deno.json") == 1 or vim.fn.filereadable(root .. "/deno.jsonc") == 1 then
				return { "denofmt" }
			end

			return {}
		end

		local function apply_js_formatter()
			local formatter = detect_js_formatter()
			for _, ft in ipairs(js_filetypes) do
				vim.g["neoformat_enabled_" .. ft] = formatter
			end
		end

		apply_js_formatter()

		vim.api.nvim_create_autocmd("DirChanged", {
			callback = apply_js_formatter,
		})

		vim.cmd("autocmd BufWritePre * Neoformat")
	end,
}
