-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local o = vim.opt

-- o.spell = false
o.clipboard = "unnamedplus"
--o.foldmethod = "indent"
o.conceallevel = 0
vim.diagnostic.enable(false)
-- vim.lsp.set_log_level("ERROR")
-- vim.g.autoformat = true
-- o.textwidth = 80
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
