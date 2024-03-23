return {
  "nvim-neorg/neorg",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = ":Neorg sync-parsers",
  -- tag = "*",
  lazy = true, -- enable lazy load
  ft = "norg", -- lazy load on file type
  cmd = "Neorg", -- lazy load on command
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
          },
        },
      },
      ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
      ["core.qol.toc"] = {},
      ["core.qol.todo_items"] = {},
      ["core.summary"] = {},
      ["core.tangle"] = { config = { report_on_empty = false } },
      ["core.journal"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
  },
}
