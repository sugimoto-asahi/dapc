local Request = require("dapc.rpc.request.Request")

--- @class StackTraceRequest : Request
local StackTraceRequest = Request:new(Request.COMMAND.STACK_TRACE)
StackTraceRequest.__index = StackTraceRequest

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
