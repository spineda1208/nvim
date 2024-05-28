function Color(color)
    color = color or "everforest"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "NONE"})
end

Color()
