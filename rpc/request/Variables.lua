local Request = require("dapc.rpc.request.Request")

--- @class VariablesRequest : Request
local VariablesRequest = Request:new(Request.COMMAND.VARIABLES)
VariablesRequest.__index = VariablesRequest

--- @enum VariablesRequestFilter
VariablesRequest.FILTER = {
	INDEXED = "indexed",
	NAMED = "named",
}

--- @class VariablesArguments
--- @field variablesReference number
--- @field filter? VariablesRequestFilter
--- @field start? number
--- @field count? number
--- @field format? ValueFormat

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments VariablesArguments
function VariablesRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return VariablesRequest
