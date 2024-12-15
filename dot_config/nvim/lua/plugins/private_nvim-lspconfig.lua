return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        texlab = false,
        digestif = {
          keys = {
            { "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
          },
        },
      },
    },
  },
}
