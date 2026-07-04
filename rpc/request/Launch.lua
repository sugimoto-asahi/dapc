local Request = require("dapc.rpc.request.Request")

local LaunchRequest = Request:new(Request.COMMAND.LAUNCH)

--- @class LaunchRequestArguments
--- @field noDebug? boolean
--- @field __restart? any

--- @class LaunchRequest : Request
--- @field arguments LaunchRequestArguments
--- @field new fun(self, seq: number, arguments: LaunchRequestArguments)

return LaunchRequest
