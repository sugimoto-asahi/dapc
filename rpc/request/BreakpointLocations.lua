local Request = require("dapc.rpc.request.Request")

--- @class BreakpointLocationsArguments
--- @field source Source
--- @field line number
--- @field column? number
--- @field endLine? number
--- @field endColumn? number

--- @class BreakpointLocationsRequest : Request
--- @field arguments BreakpointLocationsArguments
--- @field new fun(self, seq: number, arguments : BreakpointLocationsArguments)
local BreakpointLocationsRequest = Request:new(Request.COMMAND.BREAKPOINT_LOCATIONS)

return BreakpointLocationsRequest
