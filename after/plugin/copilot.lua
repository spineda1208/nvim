vim.cmd(':Copilot disable')
vim.keymap.set('i', '<C-p>', 'copilot#Accept("\\<CR>")',
               {expr = true, replace_keycodes = false})
vim.g.copilot_no_tab_map = true
