-- Leader
vim.g.mapleader = " "

-- Greatest Remaps 
vim.keymap.set("n", "Q", "<nop>")

-- Clipboard Management
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({"n", "v"}, "P", "\"+p")

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Basics
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", ":q!<CR>")

-- Move Lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', ":m .+1<CR>==")
vim.keymap.set('n', 'K', ":m .-2<CR>==")
--
-- Indenting
vim.keymap.set('n', '<', '<<')
vim.keymap.set('n', '>', '>>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Navigaton
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Commenting
vim.keymap.set("n", "<leader>/", ":Commentary<CR>")
vim.keymap.set("v", "<leader>/", ":Commentary<CR>")
