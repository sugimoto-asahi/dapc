local Request = require("dapc.rpc.request.Request")

--- @class DataBreakpointInfoArguments
--- @field variablesReference? number
--- @field name string
--- @field frameId? number
--- @field bytes? number
--- @field asAddress? boolean
--- @field mode? string

--- @class DataBreakpointInfoRequest : Request
--- @field arguments DataBreakpointInfoArguments
--- @field new fun(self, seq: number, arguments : DataBreakpointInfoArguments)
local DataBreakpointInfoRequest = Request:new(Request.COMMAND.DATA_BREAKPOINT_INFO)

return DataBreakpointInfoRequest
