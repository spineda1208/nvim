return {
	"L3MON4D3/LuaSnip",

	version = "v2.*",
	-- install jsregexp (optional!).
	build = "make install_jsregexp",

	config = function()
		local ls = require("luasnip")
		require("luasnip").config.set_config({
			enable_autosnippets = true,
			store_selection_keys = "<Tab>",
		})
		require("luasnip.loaders.from_lua").load({
			paths = "~/.config/nvim/snippets",
		})
		vim.keymap.set({ "i", "s" }, "<C-h>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end)
		vim.keymap.set({ "i", "s" }, "<C-l>", function()
			if ls.jumpable(1) then
				ls.jump(1)
			end
		end)
	end,
}
