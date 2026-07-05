local share = require("dapc.share")
local M = {}

local breakpoint_ns = vim.api.nvim_create_namespace("DapcBreakpoints")
function M.set_breakpoint()
	local source_path = vim.api.nvim_buf_get_name(0)
	local breakpoint_line = vim.api.nvim_win_get_cursor(0)[1]

	-- place the breakpoint sign
	-- set_extmark is 0-indexed for the line number
	vim.api.nvim_buf_set_extmark(0, breakpoint_ns, breakpoint_line - 1, 0, {
		sign_text = "●",
		sign_hl_group = "DapcBreakpointSign",
		id = breakpoint_line,
	})
	--- @type SourceBreakpoint
	share:add_breakpoint(source_path, breakpoint_line)
end

function M.unset_breakpoint()
	local source_path = vim.api.nvim_buf_get_name(0)
	local breakpoint_line = vim.api.nvim_win_get_cursor(0)[1]

	-- remove the breakpoint sign
	vim.api.nvim_buf_del_extmark(0, breakpoint_ns, breakpoint_line)

	share:remove_breakpoint(source_path, breakpoint_line)
end

function M.toggle_breakpoint()
	local source = vim.api.nvim_buf_get_name(0)
	local line = vim.api.nvim_win_get_cursor(0)[1]

	if share.sources[source] == nil then
		-- source does not exist yet, so it must be a set_breakpoint call
		M.set_breakpoint()
		return
	end

	if share.sources[source][line] then
		M.unset_breakpoint()
	else
		M.set_breakpoint()
	end
end
return M
