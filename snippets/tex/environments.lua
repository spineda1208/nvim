local ls = require("luasnip")
local snippet = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
	snippet(
		"new",
		fmta(
			[[
    \begin{<>}
        <>
    \end{<>}
    ]],
			{ i(1), i(2), rep(1) }
		),
		{ condition = line_begin }
	),
	snippet(
		"vbm",
		fmta(
			[[
    \begin{verbatim}
        <>
    \end{verbatim}
    ]],
			{ i(1) }
		)
	),
	snippet("np", t("\\newproblem")),
}
