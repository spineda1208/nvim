require("santiagopineda.keymaps")
require("santiagopineda.vim_settings")
require("santiagopineda.lazy_init")

-- Auto Command Group :)
local augroup = vim.api.nvim_create_augroup
local santiagopineda = augroup("santiagopineda", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
	end,
})

autocmd({ "BufWritePre" }, { group = santiagopineda, pattern = "*", command = [[%s/\s\+$//e]] })

autocmd("LspAttach", {
	group = santiagopineda,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", ".", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vs", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>rn", function()
			vim.lsp.buf.rename()
		end, opts)
	end,
})

autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.keymap.set("n", "<localleader>c", ":VimtexCompile<CR>")
		vim.keymap.set("n", "<localleader>v", ":VimtexView<CR>")
		vim.keymap.set("n", "<localleader>s", ":VimtexStop<CR>")
	end,
})

autocmd("User", {
	pattern = "vimtexeventviewreverse",
	callback = function()
		vim.fn.system("open -a Ghostty")
		vim.cmd("redraw!")
	end,
})
