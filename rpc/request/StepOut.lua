local Request = require("dapc.rpc.request.Request")

local StepOutRequest = Request:new(Request.COMMAND.STEP_OUT)

--- @class StepOutArguments
--- @field threadId number
--- @field singleThread? boolean
--- @field granularity? SteppingGranularity

--- @class StepOutRequest : Request
--- @field arguments StepOutArguments
--- @field new fun(self, seq: number, arguments: StepOutArguments)

return StepOutRequest
