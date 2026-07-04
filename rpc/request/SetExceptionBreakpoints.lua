local Request = require("dapc.rpc.request.Request")

local SetExceptionBreakpointsRequest = Request:new(Request.COMMAND.SET_EXCEPTION_BREAKPOINTS)

--- @class SetExceptionBreakpointsArguments
--- @field filters string[]
--- @field filterOptions? ExceptionFilterOptions[]
--- @field exceptionOptions? ExceptionOptions[]

--- @class SetExceptionBreakpointsRequest : Request
--- @field arguments SetExceptionBreakpointsArguments
--- @field new fun(self, seq: number, arguments: SetExceptionBreakpointsArguments)

return SetExceptionBreakpointsRequest
