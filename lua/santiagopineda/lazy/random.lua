return {
    "tpope/vim-surround", "christoomey/vim-tmux-navigator", {
        "eandrju/cellular-automaton.nvim",
        config = function()
            vim.keymap.set("n", "<leader>FUCK",
                           ":CellularAutomation make_it_rain<CR>")
        end
    }, {
        "tpope/vim-commentary",
        config = function()
            vim.cmd([[autocmd FileType gleam setlocal commentstring=//\ %s]])
        end
    }
}
