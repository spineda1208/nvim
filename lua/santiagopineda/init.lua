require("santiagopineda.remap")
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
        vim.highlight.on_yank({higroup = "IncSearch", timeout = 40})
    end
})

autocmd({"BufWritePre"},
        {group = santiagopineda, pattern = "*", command = [[%s/\s\+$//e]]})

autocmd("LspAttach", {
    group = santiagopineda,
    callback = function(e)
        local opts = {buffer = e.buf}
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", ".", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vs",
                       function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd",
                       function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "d]", function() vim.diagnostic.goto_next() end,
                       opts)
        vim.keymap.set("n", "d[", function() vim.diagnostic.goto_prev() end,
                       opts)
        vim.keymap.set("n", "<leader>vca",
                       function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vr",
                       function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end,
                       opts)
        vim.keymap.set("i", "<C-p>",
                       function() vim.lsp.buf.signature_help() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

