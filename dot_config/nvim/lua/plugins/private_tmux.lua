return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-h>", mode = { "n" }, "<Cmd>TmuxNavigateLeft<CR>" },
      { "<C-j>", mode = { "n" }, "<Cmd>TmuxNavigateDown<CR>" },
      { "<C-k>", mode = { "n" }, "<Cmd>TmuxNavigateUp<CR>" },
      { "<C-l>", mode = { "n" }, "<Cmd>TmuxNavigateRight<CR>" },
    },
  },
}
