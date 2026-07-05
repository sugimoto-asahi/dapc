local M = {}

--- Retrieve the 6-digit hex code of an existing highlight group
--- @param hl_group string Name of the highlight group
--- @param part "fg" | "bg" Part of highlight to retrieve
function M.get_hl_color(hl_group, part)
	local group = vim.api.nvim_get_hl(0, { name = hl_group })
	local color
	if part == "fg" then
		color = group.fg
	elseif part == "bg" then
		color = group.bg
	end
	return string.format("#%06x", color)
end

return M
