local Request = require("dapc.rpc.request.Request")

--- @class ExceptionInfoArguments
--- @field threadId number

--- @class ExceptionInfoRequest : Request
--- @field arguments ExceptionInfoArguments
--- @field new fun(self, seq: number, arguments: ExceptionInfoArguments)
local ExceptionInfoRequest = Request:new(Request.COMMAND.EXCEPTION_INFO)

return ExceptionInfoRequest
