local Request = require("dapc.rpc.request.Request")

local RestartFrameRequest = Request:new(Request.COMMAND.RESTART_FRAME)

--- @class RestartFrameArguments
--- @field frameId number

--- @class RestartFrameRequest : Request
--- @field arguments RestartFrameArguments
--- @field new fun(self, seq: number, arguments: RestartFrameArguments)

return RestartFrameRequest
