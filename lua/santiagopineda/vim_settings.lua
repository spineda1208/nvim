-- vim.opt.clipboard = "unnamedplus"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.termguicolors = true
vim.opt.hidden = false
vim.cmd("set guicursor+=n-v-c-i:block")

-- Set syntax sync minlines=200
-- vim.cmd("set syntax sync minlines=200")
-- Set syntax sync maxlines=500
-- vim.cmd("set syntax sync maxlines=500")
