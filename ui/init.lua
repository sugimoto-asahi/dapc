local util = require("dapc.ui.util")
local breakpoint = require("dapc.ui.breakpoint")

-- highlights setup
local highlights_ns = vim.api.nvim_create_namespace("DapcHighlights")
vim.api.nvim_set_hl(highlights_ns, "DapcBreakpointSign", { link = "DiagnosticError" })
vim.api.nvim_set_hl(highlights_ns, "DapcBreakpointLine", {})
vim.api.nvim_set_hl(highlights_ns, "DapcCurrentLine", {
	bg = util.get_hl_color("TabLineSel", "bg"),
})

--- Register all highlights
vim.api.nvim_set_hl_ns(highlights_ns)
vim.keymap.set("n", "<leader>db", breakpoint.toggle_breakpoint, {})

local M = {}

local execution_ns = vim.api.nvim_create_namespace("DapcExecution")

-- The extmark id will always simply be its line number. This makes it
-- easy to remove line highlights.
local current_line_id -- extmark id of current line

--- Reflect the current execution point.
--- This will also position the cursor at the execution point.
--- @param path string Path to file the execution is currently at
--- @param line number Line number of current execution point
function M.set_current_point(path, line)
	-- create a new buffer backing the currently executing file if it doesn't yet exist
	local bufnr = vim.fn.bufnr(path, true)

	-- regardless of whether a new buffer was created or an existing buffer is used,
	-- bring the buffer into view in the current window
	vim.api.nvim_win_set_buf(0, bufnr)

	-- position cursor at execution point
	vim.api.nvim_win_set_cursor(0, { line, 0 }) -- hardcoded to first column

	if current_line_id ~= nil then
		vim.api.nvim_buf_del_extmark(bufnr, execution_ns, current_line_id)
	end
	current_line_id = vim.api.nvim_buf_set_extmark(bufnr, execution_ns, line - 1, 0, {
		id = line,
		line_hl_group = "DapcCurrentLine",
	})
end

return M
