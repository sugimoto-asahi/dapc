local Request = require("dapc.rpc.request.Request")

local ReadMemoryRequest = Request:new(Request.COMMAND.READ_MEMORY)

--- @class ReadMemoryArguments
--- @field memoryReference string
--- @field offset? number
--- @field count number

--- @class ReadMemoryRequest : Request
--- @field arguments ReadMemoryArguments
--- @field new fun(self, seq: number, arguments: ReadMemoryArguments)

return ReadMemoryRequest
