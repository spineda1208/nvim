function Color(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return {
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
		config = function()
			Color()
		end,
	},
	{ "sainnhe/everforest", enabled = false },
	{ "kepano/flexoki-neovim", enabled = false },
	{
		"drewxs/ash.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
	},
}
