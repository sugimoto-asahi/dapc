local Request = require("dapc.rpc.request.Request")

local StackTraceRequest = Request:new(Request.COMMAND.STACK_TRACE)

--- @class StackTraceArguments
--- @field threadId number
--- @field startFrame? number
--- @field levels? number
--- @field format? StackFrameFormat

--- @class StackTraceRequest : Request
--- @field arguments StackTraceArguments
--- @field new fun(self, seq: number, arguments: StackTraceArguments)

return StackTraceRequest
