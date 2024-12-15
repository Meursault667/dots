return {
  -- Shorthand
  s(
    "hi", -- LuaSnip expands this to {trig = "hi"}
    { t("Hello, world!") }
  ),
  s({ trig = "lines", dscr = "Demo: a text node with three lines." }, {
    t({ "Line 1", "Line 2", "Line 3" }),
  }),
  s("keys_plugin", {
    t({ '{ "' }),
    i(1, "-- Keybind"),
    t({ '", ' }),
    i(2, "-- function"),
    t({ ", mode = { " }),
    i(3, '-- "n", "v", "i" '),
    t({ ' }, desc = "' }),
    i(4, "-- description"),
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
