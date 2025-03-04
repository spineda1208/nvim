-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Greatest Remaps
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Clipboard Management
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- vim.keymap.set("x", "P", '"_dP')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Basics
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", ":q!<CR>")

-- Quick Fix List
vim.keymap.set("n", "<M-n>", ":cnext<CR>")
vim.keymap.set("n", "<M-p>", ":cprev<CR>")

-- Join Lines
vim.keymap.set("n", "<M-j>", "J")
-- Move Lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", ":m .+1<CR>==")
vim.keymap.set("n", "K", ":m .-2<CR>==")

-- Indenting
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Commenting
vim.keymap.set({ "n", "v" }, "<leader>/", ":Commentary<CR>")
