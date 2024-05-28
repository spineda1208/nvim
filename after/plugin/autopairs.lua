require("nvim-autopairs").setup({
    disable_filetype = { "TelescopePrompt" },
    enable_check_bracket_line = true,
    ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
})

