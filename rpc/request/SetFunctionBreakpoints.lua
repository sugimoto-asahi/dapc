local Request = require("dapc.rpc.request.Request")

local SetFunctionBreakpointsRequest = Request:new(Request.COMMAND.SET_FUNCTION_BREAKPOINTS)

--- @class SetFunctionBreakpointsArguments
--- @field breakpoints FunctionBreakpoint[]

--- @class SetFunctionBreakpointsRequest : Request
--- @field arguments SetFunctionBreakpointsArguments
--- @field new fun(self, seq: number, arguments: SetFunctionBreakpointsArguments)

return SetFunctionBreakpointsRequest
