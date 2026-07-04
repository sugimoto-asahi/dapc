local Request = require("dapc.rpc.request.Request")

local PauseRequest = Request:new(Request.COMMAND.PAUSE)

--- @class PauseArguments
--- @field threadId number

--- @class PauseRequest : Request
--- @field arguments PauseArguments
--- @field new fun(self, seq: number, arguments: PauseArguments)

return PauseRequest
