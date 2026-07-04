local Request = require("dapc.rpc.request.Request")

local ThreadsRequest = Request:new(Request.COMMAND.THREADS)

--- @class ThreadsArguments

--- @class ThreadsRequest : Request
--- @field arguments ThreadsArguments
--- @field new fun(self, seq: number, arguments: ThreadsArguments)

return ThreadsRequest
