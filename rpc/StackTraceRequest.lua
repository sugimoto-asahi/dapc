local Request = require("dapc.rpc.Request")

--- @class StackTraceRequest : Request
local StackTraceRequest = Request:new(Request.RequestCommand.STACK_TRACE)
StackTraceRequest.__index = StackTraceRequest

--- @class StackFrameFormat
--- @field parameters? boolean
--- @field parameterTypes? boolean
--- @field parameterNames? boolean
--- @field parameterValues? boolean
--- @field line? boolean
--- @field module? boolean
--- @field includeAll? boolean

--- @class StackTraceRequestArguments
--- @field threadId number
--- @field startFrame? number
--- @field levels? number
--- @field format? StackFrameFormat

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments StackTraceRequestArguments
function StackTraceRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return StackTraceRequest
