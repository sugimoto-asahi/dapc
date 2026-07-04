local Request = require("dapc.rpc.request.Request")

local RestartRequest = Request:new(Request.COMMAND.RESTART)

--- @class RestartArguments
--- @field arguments? LaunchRequestArguments | AttachRequestArguments

--- @class RestartRequest : Request
--- @field arguments RestartArguments
--- @field new fun(self, seq: number, arguments: RestartArguments)

return RestartRequest
