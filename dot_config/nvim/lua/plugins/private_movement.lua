return {
  {
    "mg979/vim-visual-multi",
    event = "BufReadPre",
  },
  {
    "abecodes/tabout.nvim",
    opt = true,
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
    config = function()
      require("tabout").setup({
        completion = false,
        ignore_beginning = false,
      })
    end,
  },
}
