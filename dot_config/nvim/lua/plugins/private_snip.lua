return {
  { "evesdropper/luasnip-latex-snippets.nvim" },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"
      -- Laden der .json Snippets (VSCode-Format)
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { snippet_path .. "/vscode" },
      })
      -- Laden der .lua Snippets
      require("luasnip.loaders.from_lua").load({
        paths = { snippet_path .. "/lua" },
      })
      require("luasnip").config.setup({
        update_events = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })
    end,
  },
}
