local M = {}

--- @type table<string, table<SourceBreakpoint, boolean>>
M.sources = {}

--- Add a empty source (no breakpoints) to the sources
function M:add_source(path)
	self.sources[path] = {}
end

--- Add a breakpoint to a source
--- @argument path string Path to source
--- @argument line number Line number to add breakpoint at
function M:add_breakpoint(path, line)
	if self.sources[path] == nil then
		--- This source is new, so we need to add it to the sources
		self:add_source(path)
	end

	self.sources[path][line] = true
end

--- Remove a breakpoint from a source
--- @argument path string Path to source
--- @argument line number Line number of the breakpoint to remove
function M:remove_breakpoint(path, line)
	self.sources[path][line] = nil
end

return M
