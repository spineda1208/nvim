local ls = require("luasnip")
local snippet = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {
	-- Imports
	-- snippet("fmp", fmta("from <> import <>", { i(1, "module"), i(2, "...") })),
	-- snippet("ima", fmta("import <> as <>", { i(1, "module"), i(2, "abv") })),
	-- Functions
	-- snippet("fn", fmta("def <>(<>):", { i(1, "function"), i(2, "parameters") })),
	-- snippet("fnt", fmta("def <>(<>) -> <>:", { i(1, "function"), i(2, "parameters"), i(3, "return_type") })),
	-- Loops
	-- snippet("forr", fmta("for i in range(<>):", { i(1) })),
	-- snippet("fori", fmta("for <> in <>:", { i(1, "item"), i(2, "iterable") })),
	-- Conditionals
	snippet(
		{ trig = "iff", snippetType = "autosnippet" },
		fmta(
			[[if __name__ == "__main__":
    <>
    ]],
			{ i(1) }
		)
	),
	snippet("ifi", fmta("if not isinstance(<>, <>):", { i(1, "variable"), i(2, "type") })),
	-- Errors
	-- snippet({ trig = "rte", snippetType = "autosnippet" }, fmta('raise TypeError("<>")', { i(0) })),
	-- snippet({ trig = "rve", snippetType = "autosnippet" }, fmta('raise ValueError("<>")', { i(0) })),
}
