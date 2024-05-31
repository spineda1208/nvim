return {
    "stevearc/oil.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},

    config = function()
        require('oil').setup({
            default_file_explorer = true,
            columns = {"icon"},
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
                ["M-h"] = "actions.select_split"
            },
            view_options = {show_hidden = true}
        })
    end
}
