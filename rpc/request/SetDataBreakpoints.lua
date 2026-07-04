local Request = require("dapc.rpc.request.Request")

local SetDataBreakpointsRequest = Request:new(Request.COMMAND.SET_DATA_BREAKPOINTS)

--- @class SetDataBreakpointsArguments
--- @field breakpoints DataBreakpoint[]

--- @class SetDataBreakpointsRequest : Request
--- @field arguments SetDataBreakpointsArguments
--- @field new fun(self, seq: number, arguments: SetDataBreakpointsArguments)

return SetDataBreakpointsRequest
