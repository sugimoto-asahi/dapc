local Request = require("dapc.rpc.request.Request")

--- @class ContinueArguments
--- @field threadId number
--- @field singleThread? boolean

--- @class ContinueRequest : Request
--- @field arguments ContinueArguments
--- @field new fun(self, seq: number, arguments : ContinueArguments)
local ContinueRequest = Request:new(Request.COMMAND.CONTINUE)

return ContinueRequest
