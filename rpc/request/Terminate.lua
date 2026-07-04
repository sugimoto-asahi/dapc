local Request = require("dapc.rpc.request.Request")

local TerminateRequest = Request:new(Request.COMMAND.TERMINATE)

--- @class TerminateArguments
--- @field restart? boolean

--- @class TerminateRequest : Request
--- @field arguments TerminateArguments
--- @field new fun(self, seq: number, arguments: TerminateArguments)

return TerminateRequest
