return {
  { "norcalli/nvim-colorizer.lua" },
  {
    "rktjmp/lush.nvim",
    -- if you wish to use your own colorscheme:
    { dir = "/home/usr/.config/nvim/lua/colors/zenbones_custom.nvim/", lazy = false },
  },
  -- zenbones
  -- {
  --   "zenbones-theme/zenbones.nvim",
  --   dependencies = {
  --     "rktjmp/lush.nvim",
  --   },
  --   lazy = false,
  --   priority = 1000,
  -- },
  -- nightfox
  --{
  --  "EdenEast/nightfox.nvim",
  --  opts = {
  --    styles = {
  --      comments = "italic",
  --      keywords = "bold",
  --      types = "italic,bold",
  --    },
  --  },
  --},
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordbones",
    },
  },
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "nord",
      sections = {
        lualine_z = {},
      },
    },
  },
}
