return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>j", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "<leader>k", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "<leader>l", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "<leader>;", function()
            harpoon:list():select(4)
        end)
        vim.keymap.set("n", "<leader>n", function()
            harpoon:list():select(5)
        end)
        vim.keymap.set("n", "<leader>m", function()
            harpoon:list():select(6)
        end)

        vim.keymap.set("n", "<leader><C-j>",
                       function() harpoon:list():replace_at(1) end)
        vim.keymap.set("n", "<leader><C-k>",
                       function() harpoon:list():replace_at(2) end)
        vim.keymap.set("n", "<leader><C-l>",
                       function() harpoon:list():replace_at(3) end)
        vim.keymap.set("n", "<leader><C-n>",
                       function() harpoon:list():replace_at(4) end)
    end
}
-- return {}
