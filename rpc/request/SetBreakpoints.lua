local Request = require("dapc.rpc.request.Request")

local SetBreakpointsRequest = Request:new(Request.COMMAND.SET_BREAKPOINTS)

--- @class SetBreakpointsArguments
--- @field source Source
--- @field breakpoints? SourceBreakpoint[]
--- @field lines? number[]
--- @field sourceModified? boolean

--- @class SetBreakpointsRequest : Request
--- @field arguments SetBreakpointsArguments
--- @field new fun(self, seq: number, arguments: SetBreakpointsArguments)

return SetBreakpointsRequest
