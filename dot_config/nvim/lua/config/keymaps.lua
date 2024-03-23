-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--| Telekasten    |------------------------------------------------|
--|---------------|------------------------------------------------|
--
-- Mapping helper
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- On hesitation, bring up the command panel
map("n", "<leader>z", ":lua require('telekasten').panel()<CR>")

-- Function mappings
map("n", "<leader>zf", ":lua require('telekasten').find_notes()<CR>", { desc = "Find Notes" })
map("n", "<leader>zd", ":lua require('telekasten').find_daily_notes()<CR>", { desc = "Find Daily Notes" })
map("n", "<leader>zg", ":lua require('telekasten').search_notes()<CR>", { desc = "Search Notes" })
map("n", "<leader>zz", ":lua require('telekasten').follow_link()<CR>", { desc = "Follow Link" })
map("n", "<leader>zT", ":lua require('telekasten').goto_today()<CR>", { desc = "Goto Today" })
map("n", "<leader>zW", ":lua require('telekasten').goto_thisweek()<CR>", { desc = "Goto This Week" })
map("n", "<leader>zw", ":lua require('telekasten').find_weekly_notes()<CR>", { desc = "Find weekly notes" })
map("n", "<leader>zn", ":lua require('telekasten').new_note()<CR>", { desc = "new Note" })
map("n", "<leader>zN", ":lua require('telekasten').new_templated_note()<CR>", { desc = "new templated Note" })
map("n", "<leader>zy", ":lua require('telekasten').yank_notelink()<CR>", { desc = "Yank link from Clipboard" })
map("n", "<leader>zc", ":lua require('telekasten').show_calendar()<CR>", { desc = "show Calendar" })
map("n", "<leader>zC", ":CalendarT<CR>", { desc = "Show Big Calendar" })
map("n", "<leader>zi", ":lua require('telekasten').paste_img_and_link()<CR>", { desc = "paste image and link" })
map("n", "<leader>zt", ":lua require('telekasten').toggle_todo()<CR>", { desc = "toggle todo" })
map("n", "<leader>zb", ":lua require('telekasten').show_backlinks()<CR>", { desc = "show backlinks" })
map("n", "<leader>zF", ":lua require('telekasten').find_friends()<CR>", { desc = "find friends" })
map("n", "<leader>zI", ":lua require('telekasten').insert_img_link({ i=true })<CR>", { desc = "insert image link" })
map("n", "<leader>zp", ":lua require('telekasten').preview_img()<CR>", { desc = "preview image" })
map("n", "<leader>zm", ":lua require('telekasten').browse_media()<CR>", { desc = "browse media" })
map("n", "<leader>#", ":lua require('telekasten').show_tags()<CR>", { desc = "show tags" })
map("n", "<leader>zr", ":lua require('telekasten').rename_note()<CR>", { desc = "rename note" })
map("n", "<leader>[", ":lua require('telekasten').insert_link({ i=true })<CR>", { desc = "insert link" })

--| obsidian.nvim |------------------------------------------------|
--|---------------|------------------------------------------------|
