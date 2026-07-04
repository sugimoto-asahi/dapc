local Request = require("dapc.rpc.request.Request")

--- @class DisconnectArguments
--- @field restart? boolean
--- @field terminateDebuggee? boolean
--- @field suspendDebuggee? boolean

--- @class DisconnectRequest : Request
--- @field arguments DisconnectArguments
--- @field new fun(self, seq: number, arguments : DisconnectArguments)
local DisconnectRequest = Request:new(Request.COMMAND.DISCONNECT)

return DisconnectRequest
