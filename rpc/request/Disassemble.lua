local Request = require("dapc.rpc.request.Request")

--- @class DisassembleArguments
--- @field memoryReference string
--- @field offset? number
--- @field instructionOffset? number
--- @field instructionCount number
--- @field resolveSymbols? boolean

--- @class DisassembleRequest : Request
--- @field arguments DisassembleArguments
--- @field new fun(self, seq: number, arguments : DisassembleArguments)
local DisassembleRequest = Request:new(Request.COMMAND.DISASSEMBLE)

return DisassembleRequest
