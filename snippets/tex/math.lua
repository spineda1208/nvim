local ls = require("luasnip")
local snippet = require("luasnip").snippet
local i = require("luasnip").insert_node
local t = require("luasnip").text_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]
end

return {
	snippet(
		{ trig = "ff", snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", { i(1), i(2) }),
		{ condition = in_mathzone }
	),
	snippet({ trig = "->", snippetType = "autosnippet" }, t([[\rightarrow]])),
}
