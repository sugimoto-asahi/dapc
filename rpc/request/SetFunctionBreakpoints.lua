local Request = require("dapc.rpc.request.Request")

--- @class SetFunctionBreakpointsArguments
--- @field breakpoints FunctionBreakpoint[]

--- @class SetFunctionBreakpointsRequest : Request
--- @field arguments SetFunctionBreakpointsArguments
local SetFunctionBreakpointsRequest = Request:new(Request.COMMAND.SET_FUNCTION_BREAKPOINTS)
SetFunctionBreakpointsRequest.__index = SetFunctionBreakpointsRequest

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments SetFunctionBreakpointsArguments
function SetFunctionBreakpointsRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return SetFunctionBreakpointsRequest
