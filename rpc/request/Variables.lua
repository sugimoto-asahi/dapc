local Request = require("dapc.rpc.request.Request")

local VariablesRequest = Request:new(Request.COMMAND.VARIABLES)

--- @enum VariableFilter
local VariableFilter = {
	INDEXED = "indexed",
	NAMED = "named",
}

--- @class VariablesArguments
--- @field variablesReference number
--- @field filter? VariableFilter
--- @field start? number
--- @field count? number
--- @field format? ValueFormat

--- @class VariablesRequest : Request
--- @field arguments VariablesArguments
--- @field new fun(self, seq: number, arguments: VariablesArguments)

return VariablesRequest
