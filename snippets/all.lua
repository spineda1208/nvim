local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

-- Use for dynamic nodes if needed in future config

return {
	s("hw", t("Hello, World!")),
	s("sp", t("Santiago Pineda")),
	s("test", fmta("print(<>)", { i(1) })),
}
