local Request = require("dapc.rpc.request.Request")

local TerminateThreadsRequest = Request:new(Request.COMMAND.TERMINATE_THREADS)

--- @class TerminateThreadsArguments
--- @field threadIds? number[]

--- @class TerminateThreadsRequest : Request
--- @field arguments TerminateThreadsArguments
--- @field new fun(self, seq: number, arguments: TerminateThreadsArguments)

return TerminateThreadsRequest
