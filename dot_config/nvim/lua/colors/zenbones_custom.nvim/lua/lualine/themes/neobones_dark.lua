-- This file is auto-generated by shipwright.nvim
local common_fg = "#7BA9C5"
local inactive_bg = "#1F2E37"
local inactive_fg = "#D1E0DA"

return {
	normal = {
		a = { bg = "#4F6F82", fg = common_fg, gui = "bold" },
		b = { bg = "#334A57", fg = common_fg },
		c = { bg = "#273944", fg = "#C6D5CF" },
	},

	insert = {
		a = { bg = "#343F6D", fg = common_fg, gui = "bold" },
	},

	command = {
		a = { bg = "#62415B", fg = common_fg, gui = "bold" },
	},

	visual = {
		a = { bg = "#3A3E3D", fg = common_fg, gui = "bold" },
	},

	replace = {
		a = { bg = "#3B2023", fg = common_fg, gui = "bold" },
	},

	inactive = {
		a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
		b = { bg = inactive_bg, fg = inactive_fg },
		c = { bg = inactive_bg, fg = inactive_fg },
	},
}