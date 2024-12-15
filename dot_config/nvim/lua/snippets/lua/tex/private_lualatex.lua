local ls = require("luasnip") -- Lade LuaSnip
local s = ls.snippet -- Kürzel für Snippets
local t = ls.text_node -- Kürzel für Textblöcke
local i = ls.insert_node -- Kürzel für Einfügepunkte

-- Liste von Snippets für tex
local snippets = {
  s("luabang", {
    t({ "% !Tex program = lualatex" }),
  }),
  s("luab", {
    t({ "\\begin{luacode}", "    " }),
    i(1, "-- Dein Lua-Code hier"),
    t({ "", "\\end{luacode}" }),
  }),
  s("luafn", {
    t("function "),
    i(1, "function_name"),
    t("("),
    i(2, "args"),
    t({ ")", "    " }),
    i(3, "-- Deine Funktion hier"),
    t({ "", "end" }),
  }),
  s("luav", {
    t("local "),
    i(1, "var_name"),
    t(" = "),
    i(2, "value"),
    t({ "", "print(" }),
    i(1),
    t(")"),
  }),
  s("luatb", {
    i(1, "local table_name"),
    t(" = {"),
    t({ "", "    " }),
    i(2, "key"),
    t(" = "),
    i(3, "value"),
    t(","),
    t({ "", "    " }),
    i(4, "key2"),
    t(" = "),
    i(5, "value2"),
    t({ "", "}" }),
  }),
  s("luainc", {
    t("local "),
    i(1, "lib_name"),
    t(" = require('"),
    i(2, "library"),
    t({ "')", "print(" }),
    i(1),
    t(")"),
  }),
  s("luadoc", {
    t({
      "% !Tex program = lualatex",
      "\\documentclass[",
    }),
    i(1, "options"),
    t({
      "]{article}",
      "\\usepackage{luacode}",
      "\\usepackage{fontspec}",
      "",
    }),
    i(2, "-- Weitere Optionen hier"),
    t({
      "",
      "\\begin{document}",
      "",
    }),
    i(3, "-- Dein Inhalt hier"),
    t({
      "",
      "\\end{document}",
    }),
  }),
}

-- Snippets für tex hinzufügen
ls.add_snippets("tex", snippets)
