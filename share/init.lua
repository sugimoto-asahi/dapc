local M = {}

--- @class dapc.Breakpoint
--- @field id number Unique identifier for breakpoint

--- @type table<string, table<number, boolean>>
M.sources = {}

--- Add a empty source (no breakpoints) to the sources
function M:add_source(path)
	self.sources[path] = {}
end

--- Retrieve all the set breakpoints
--- @return table<string, SourceBreakpoint[]>
function M:get_breakpoints()
	local result = {}
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
--- @note The list of authorative breakpoints is ordered in the same way as the arguments
--- to SetBreakpoints.
--- See https://microsoft.github.io/debug-adapter-protocol/specification#Requests_SetBreakpoints
function M:update_breakpoints(breakpoints)
	--- @type DapcEventUpdateBreakpointData[]
	local updates = {}

	-- find out what source file the updates are for
	local path = breakpoints[1].source.path
	local old_breakpoints = self:get_breakpoints()[path]
	for index, new_breakpoint in ipairs(breakpoints) do
		local old_breakpoint = old_breakpoints[index]
		if old_breakpoint.line ~= new_breakpoint.line then
			table.insert(updates, { path = path, old = old_breakpoint.line, new = new_breakpoint.line })
		end
	end

	for _, update in ipairs(updates) do
		api.publish.update_breakpoint(update.path, update.old, update.new)
	end
end

--- Add a breakpoint to a source
--- @argument path string Path to source
--- @argument line number Line number to add breakpoint at
function M:add_breakpoint(path, line)
	if self.sources[path] == nil then
		--- This source is new, so we need to add it to the sources
		self:add_source(path)
	end
	api.publish.set_breakpoint(path, line)

	self.sources[path][line] = true
end

--- Remove a breakpoint from a source
--- @argument path string Path to source
--- @argument line number Line number of the breakpoint to remove
function M:remove_breakpoint(path, line)
	self.sources[path][line] = nil

	api.publish.unset_breakpoint(path, line)
end

return M
