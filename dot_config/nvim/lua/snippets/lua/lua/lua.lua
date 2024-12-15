local ls = require("luasnip") -- Lade LuaSnip
local s = ls.snippet -- Kürzel für Snippets
local t = ls.text_node -- Kürzel für Textblöcke
local i = ls.insert_node -- Kürzel für Einfügepunkte

local snippets = {
  s("keys_plugin", {
    t({ '{ "' }),
    i(1, "Keybind"),
    t({ '", ' }),
    i(2, "function"),
    t({ ", mode = { " }),
    i(3, '"n", "v", "i" '),
    t({ ' }, desc = "' }),
    i(4, "description"),
    t({ '" },' }),
  }),
  s("plugin_lua", {
    t({ '{ "' }),
    i(1, "Reponame"),
    t({ '", ' }),
    i(2, "keys"),
    t({ " = { " }),
    i(3, "-- keybinds here"),
    t({ '" }, },' }),
  }),
}

-- Snippets für tex hinzufügen
ls.add_snippets("lua", snippets)
