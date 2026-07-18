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

return api
