---@diagnostic disable: unused-local
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

local snippets = {
	s(
		"aspn",
		fmta([[
		<>.<>.nixos = { pkgs, ... }: {
			<>
		}
		]],
			-- "<>.<>.nixos = {\n\t<>\n}",
			{
				c(2, {
					t("n"),
					t("i"),
					i(1)
				}),
				i(1, "name"),
				i(3, "this")
			}
		)
	),
	s(
		"map",
		fmt(
			"map('{}', '{}', '{}', opts)",
			{
				c(3, {
					t("n"),
					t("i"),
					i(1)
				}),
				c(1, {
					fmt("<leader>{}", { i(1) }),
					fmt("<M-{}>", { i(1) }),
					fmt("<C-{}>", { i(1) }),
					fmt("{}", { i(1) }),
				}),
				c(2, {
					i(1),
					fmt("<cmd>{}<cr>", { i(1) }),
					fmt("<cmd>lua require(\"{}\").{}<cr>", { i(1), i(2) }),
				})
			}
		)
	),
}

return snippets
