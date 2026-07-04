local Request = require("dapc.rpc.request.Request")

local WriteMemoryRequest = Request:new(Request.COMMAND.WRITE_MEMORY)

--- @class WriteMemoryArguments
--- @field memoryReference string
--- @field offset? number
--- @field allowPartial? boolean
--- @field data string

--- @class WriteMemoryRequest : Request
--- @field arguments WriteMemoryArguments
--- @field new fun(self, seq: number, arguments: WriteMemoryArguments)

return WriteMemoryRequest
