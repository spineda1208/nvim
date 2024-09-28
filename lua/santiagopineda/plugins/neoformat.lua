return {
	"sbdchd/neoformat",
	config = function()
		vim.g.neoformat_try_node_exe = 1
		vim.g.neoformat_enabled_python = { "ruff" }
		vim.cmd("autocmd BufWritePre * Neoformat")
	end,
}
