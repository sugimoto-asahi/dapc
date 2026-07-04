local Request = require("dapc.rpc.request.Request")

local EvaluateRequest = Request:new(Request.COMMAND.EVALUATE)

--- @enum EvaluateArgumentsContext
EvaluateRequest.EvaluateArgumentsContext = {
	WATCH = "watch",
	REPL = "repl",
	HOVER = "hover",
	CLIPBOARD = "clipboard",
	VARIABLES = "variables",
}

--- @class EvaluateArguments
--- @field expression string
--- @field frameId? number
--- @field line? number
--- @field column? number
--- @field source? Source
--- @field context? EvaluateArgumentsContext
--- @field format? ValueFormat

--- @class EvaluateRequest : Request
--- @field arguments EvaluateArguments
--- @field new fun(self, seq: number, arguments: EvaluateArguments)

return EvaluateRequest
