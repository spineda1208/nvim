return {
	"sbdchd/neoformat",
	config = function()
		vim.g.neoformat_try_node_exe = 1
		vim.cmd("autocmd BufWritePre * Neoformat")
	end,
}
