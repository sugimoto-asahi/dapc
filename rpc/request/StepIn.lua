local Request = require("dapc.rpc.request.Request")

local StepInRequest = Request:new(Request.COMMAND.STEP_IN)

--- @class StepInArguments
--- @field threadId number
--- @field singleThread? boolean
--- @field targetId? number
--- @field granularity? SteppingGranularity

--- @class StepInRequest : Request
--- @field arguments StepInArguments
--- @field new fun(self, seq: number, arguments: StepInArguments)

return StepInRequest
