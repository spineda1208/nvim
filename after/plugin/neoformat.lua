vim.g.neoformat_try_node_exe = 1
vim.cmd("autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx Neoformat")
vim.cmd([[autocmd BufWritePre *.ts,*.tsx,*.js,*.jsx lua vim.lsp.buf.execute_command({ command = "_typescript.organizeImports", arguments = {vim.api.nvim_buf_get_name(0)}, title = ""})]])
