local Request = require("dapc.rpc.request.Request")

local ReverseContinueRequest = Request:new(Request.COMMAND.REVERSE_CONTINUE)

--- @class ReverseContinueArguments
--- @field threadId number
--- @field singleThread? boolean

--- @class ReverseContinueRequest : Request
--- @field arguments ReverseContinueArguments
--- @field new fun(self, seq: number, arguments: ReverseContinueArguments)

return ReverseContinueRequest
