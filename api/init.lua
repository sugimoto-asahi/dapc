local api = {
	publish = {},
}

--- @alias DapcVariableHint
--- | "read_only"

--- @class DapcVariable
--- @field name string Name of variable
--- @field value string | DapcVariable Value of variable
--- @field hint? DapcVariableHint
--- @field type? string Type of variable

--- Publish the latest set of variables and their values.
--- @param variables Variable[] Array of variables
function api.publish.variables(variables)
	-- alphabetical sort
	local dapc_variables = {}

	for _, variable in ipairs(variables) do
		local hint
		if variable["presentationHint"] ~= nil then
			hint = "read_only"
		end

		--- @type DapcVariable
		local dapc_variable = {
			name = variable.name,
			value = variable.value,
			type = variable.type,
			hint = hint,
		}
		table.insert(dapc_variables, dapc_variable)
	end

	vim.api.nvim_exec_autocmds("User", {
		pattern = "DapcVariables",
		--- @type DapcVariable[]
		data = dapc_variables,
	})
end

return api
