return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    --   -- Required.
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<localleader>w", "<cmd>ObsidianWorkspace<cr>", mode = { "n", "v" }, desc = "Workspace Switcher" },
    { "<localleader>o", "<cmd>ObsidianQuickSwitch<cr>", mode = { "n", "v" }, desc = "Quick Switch" },
    { "<localleader>b", "<cmd>ObsidianBacklinks<cr>", mode = { "n", "v" }, desc = "Backlink Switch" },
    { "<localleader>t", "<cmd>ObsidianTOC<cr>", mode = { "n", "v" }, desc = "Toc" },
    { "<localleader>#", "<cmd>ObsidianTags<cr>", mode = { "n", "v" }, desc = "Tag Switch" },
    { "<localleader>l", "<cmd>ObsidianLinks<cr>", mode = { "n", "v" }, desc = "Link Switch" },
    { "<localleader>d", "<cmd>ObsidianDailies<cr>", mode = { "n", "v" }, desc = "Daily Switch" },
    { "<localleader>D", "<cmd>ObsidianToday<cr>", mode = { "n", "v" }, desc = "Today" },
    { "<localleader>Y", "<cmd>ObsidianYesterday<cr>", mode = { "n", "v" }, desc = "Yesterday" },
    { "<localleader>T", "<cmd>ObsidianTomorrow<cr>", mode = { "n", "v" }, desc = "Tomorrow" },
    { "<localleader>s", "<cmd>ObsidianSearch<cr>", mode = { "n", "v" }, desc = "Obsidian Search & New" },
    { "<localleader>E", "<cmd>ObsidianExtractNote<cr>", mode = { "n", "v" }, desc = "Extract" },
    { "<localleader>f", "<cmd>ObsidianFollowLink vsplit<cr>", mode = { "n", "v" }, desc = "Split" },
    { "<localleader>p", "<cmd>ObsidianPasteImg<cr>", mode = { "n", "v" }, desc = "Paste Image" },
  },
  opts = {
    ui = {
      enable = false,
    },
    workspaces = {
      {
        name = "docs",
        path = "~/01_docs/",
        overrides = {},
      },
    },
    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },
    mappings = {
      -- Smart action depending on context, either follow link or toggle checkbox.
      --    ["<cr>"] = {
      --      action = function()
      --        return require("obsidian").util.smart_action()
      --      end,
      --      opts = { buffer = true, expr = true },
      --    },
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
    },
  },
}
