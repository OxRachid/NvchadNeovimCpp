-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",

	hl_override = {
		Comment = { fg = "#646e82", italic = false, bold = true },
		["@comment"] = { fg = "#646e82", italic = false, bold = true  },
	},
}

return M
