local Request = require("dapc.rpc.request.Request")

local SetInstructionBreakpointsRequest = Request:new(Request.COMMAND.SET_INSTRUCTION_BREAKPOINTS)

--- @class SetInstructionBreakpointsArguments
--- @field breakpoints InstructionBreakpoint[]

--- @class SetInstructionBreakpointsRequest : Request
--- @field arguments SetInstructionBreakpointsArguments
--- @field new fun(self, seq: number, arguments: SetInstructionBreakpointsArguments)

return SetInstructionBreakpointsRequest
