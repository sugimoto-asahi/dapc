local Types = require("dapc.rpc.Types")

local api = {
	publish = {},
}

-- Define events that dapc will fire
--- @alias DapcVariableHint
--- | "read_only"

--- @class DapcVariable
--- @field name string Name of variable
--- @field value string | DapcVariable Value of variable
--- @field reference number Variable reference
--- @note See https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable,
--- particularly the part about variablesReference
--- @field hint? DapcVariableHint
--- @field var_type? string Type of variable

--- Publish the latest set of variables and their values.
--- @param variables Variable[] Array of variables
function api.publish.variables(variables)
	local dapc_variables = {}

	for _, variable in ipairs(variables) do
		local var_type = nil
		if variable["type"] then
			var_type = variable["type"]
		end

		local hint = nil
		if variable["presentationHint"] then
			if variable["presentationHint"]["attributes"] then
				if
					variable["presentationHint"]["attributes"]
					== Types.VARIABLE_PRESENTATION_HINT_ATTRIBUTES.READ_ONLY
				then
					hint = "read_only"
				end
			end
		end

		--- @type DapcVariable
		local dapc_variable = {
			name = variable.name,
			value = variable.value,
			reference = variable.variablesReference,
			var_type = var_type,
			hint = hint,
		}
		table.insert(dapc_variables, dapc_variable)
	end

	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcEventVariables",
		--- @type DapcVariable[]
		data = dapc_variables,
	})
end

--- Announce that a new suspended state was started
--- A suspended state lasts from when execution stops to the next time
--- execution resumes.
--- @note https://microsoft.github.io/debug-adapter-protocol/overview
--- See "Lifetime of Objects References"
function api.publish.start_state()
	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcEventStartState",
		data = {},
	})
end

--- Announce that the suspended state has ended
function api.publish.end_state()
	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcEventEndState",
		data = {},
	})
end

--- @class DapcEventExecutionPointData
--- @field path string Absolute path to file where execution point is in
--- @field row number Row of execution point

--- Publish the current execution point the adapter is stopped at
function api.publish.execution_point(path, row)
	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcEventExecutionPoint",
		--- @type DapcEventExecutionPointData
		data = {
			path = path,
			row = row,
		},
	})
end

--- @class DapcEventSetBreakpointData
--- @field path string Absolute path to file where breakpoint is in
--- @field row number Row number of breakpoint

--- Publish an attempt to set a breakpoint
--- Handlers should be aware that while they may display the breakpoint visually at
--- the specified line (i.e. a red dot in the sign column), the actual set breakpoint
--- is prone to change and should be updated visually. Changes, if any, are broadcast
--- with DapcEventUpdateBreakpoint.
--- @param path string Absolute path to file the breakpoint was set in
--- @param row number Row number of breakpoint
function api.publish.set_breakpoint(path, row)
	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcEventSetBreakpoint",
		--- @type DapcEventSetBreakpointData
		data = {
			path = path,
			row = row,
		},
	})
end

--- @class DapcEventUpdateBreakpointData
--- @field path string Absolute path to file where breakpoint is in
--- @field old number Old row number of breakpoint
--- @field new number New (and authorative) row number of breakpoint

--- Publish an update to a breakpoint
--- @param path string Absolute path to file the breakpoint was set in
--- @param old number Old row number of breakpoint
--- @param new number New (and authorative) row number of breakpoint
function api.publish.update_breakpoint(path, old, new)
	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcEventUpdateBreakpoint",
		--- @type DapcEventUpdateBreakpointData
		data = {
			path = path,
			old = old,
			new = new,
		},
	})
end

--- Publish an unsetting of a breakpoint
--- @param path string Absolute path to file the breakpoint was set in
--- @param row number Row number of breakpoint that was unset
function api.publish.unset_breakpoint(path, row)
	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcEventUnsetBreakpoint",
		--- @type DapcEventSetBreakpointData
		data = {
			path = path,
			row = row,
		},
	})
end

return api
