local Request = require("dapc.rpc.Request")

--- @class StackTraceRequest : Request
local StackTraceRequest = Request:new(Request.RequestCommand.STACK_TRACE)
StackTraceRequest.__index = StackTraceRequest

--- @class StackTraceRequestArguments
--- @field threadId number
--- @field startFrame? number
--- @field levels? number
--- @field format? StackFrameFormat

--- @class StackTraceResponseBody
--- @field stackFrames StackFrame[]
--- @field totalFrames? number

--- @class StackTraceResponse : Response
--- @field body StackTraceResponseBody

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
