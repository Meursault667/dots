-- This file is auto-generated by shipwright.nvim
local common_fg = "#A5A5B0"
local inactive_bg = "#292934"
local inactive_fg = "#E9E3C5"

return {
	normal = {
		a = { bg = "#565668", fg = common_fg, gui = "bold" },
		b = { bg = "#414151", fg = common_fg },
		c = { bg = "#2F2F3C", fg = "#DDD8BB" },
	},

	insert = {
		a = { bg = "#364F59", fg = common_fg, gui = "bold" },
	},

	command = {
		a = { bg = "#614A82", fg = common_fg, gui = "bold" },
	},

	visual = {
		a = { bg = "#49473E", fg = common_fg, gui = "bold" },
	},

	replace = {
		a = { bg = "#47272A", fg = common_fg, gui = "bold" },
	},

	inactive = {
		a = { bg = inactive_bg, fg = inactive_fg, gui = "bold" },
		b = { bg = inactive_bg, fg = inactive_fg },
		c = { bg = inactive_bg, fg = inactive_fg },
	},
}