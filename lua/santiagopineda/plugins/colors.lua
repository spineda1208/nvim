function Color(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
end

return {
	{ "nyoom-engineering/oxocarbon.nvim" },
	{
		"folke/tokyonight.nvim",
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"sainnhe/everforest",
		config = function()
			Color()
		end,
	},

	{ "kepano/flexoki-neovim" },
}
