local api = require("dapc.api")

--- @alias dapc.Breakpoints.Source.Line number Line number of breakpoint
--- @alias dapc.Breakpoints.Source.Path string Absolute path to file where
--- the breakpoint is

--- @class dapc.Breakpoints Manages all breakpoint setting / updates
--- @field sources table<dapc.Breakpoints.Source.Path,
--- |              table<dapc.Breakpoints.Source.Line, boolean>>
local Breakpoints = {
	sources = {},
}

--- Set a breakpoint
--- @param path string Absolute path to file to set the breakpoint in
--- @param line number Line number of breakpoint
function Breakpoints:set_breakpoint(path, line)
	api.publish.set_breakpoint(path, line)
	self.sources[path][line] = true
end

--- Unset a breakpoint
--- @param path string Absolute path to file the target breakpoint is in
--- @param line number Line number of breakpoint
function Breakpoints:unset_breakpoint(path, line)
	self.sources[path][line] = false
	api.publish.unset_breakpoint(path, line)
end

--- Toggle breakpoints on the current line
function Breakpoints:toggle_breakpoint()
	local path = vim.api.nvim_buf_get_name(0)
	local line = vim.api.nvim_win_get_cursor(0)[1]

	if not self.sources[path] then
		self.sources[path] = {}
		-- source does not exist yet, so it must be a set_breakpoint call
		Breakpoints:set_breakpoint(path, line)
		return
	end

	if self.sources[path][line] then
		Breakpoints:unset_breakpoint(path, line)
	else
		Breakpoints:set_breakpoint(path, line)
	end
end

--- Retrieve all the set breakpoints
--- @return table<dapc.Breakpoints.Source.Path, SourceBreakpoint[]>
function Breakpoints:get_breakpoints()
	local result = {}
	-- serialize into array
	for path, breakpoints in pairs(self.sources) do
		result[path] = {}
		for row, _ in pairs(breakpoints) do
			table.insert(result[path], { line = row })
		end
	end
	return result
end

--- Update breakpoints with authorative sources
--- @param breakpoints Breakpoint[] List of all authorative breakpoints
--- @note The list of authorative breakpoints is ordered in the same way
--- as the arguments to SetBreakpoints.
--- See https://microsoft.github.io/debug-adapter-protocol/specification#Requests_SetBreakpoints
function Breakpoints:update_breakpoints(breakpoints)
	--- @type DapcEventUpdateBreakpointData[]
	local updates = {}

	-- find out what source file the updates are for
	local path = breakpoints[1].source.path
	local old_breakpoints = self:get_breakpoints()[path]
	for index, new_breakpoint in ipairs(breakpoints) do
		local old_breakpoint = old_breakpoints[index]
		if old_breakpoint.line ~= new_breakpoint.line then
			table.insert(updates, {
				path = path,
				old = old_breakpoint.line,
				new = new_breakpoint.line,
			})
		end
	end

	for _, update in ipairs(updates) do
		api.publish.update_breakpoint(update.path, update.old, update.new)
	end
end

return Breakpoints
