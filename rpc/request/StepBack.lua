local Request = require("dapc.rpc.request.Request")

local StepBackRequest = Request:new(Request.COMMAND.STEP_BACK)

--- @class StepBackArguments
--- @field threadId number
--- @field singleThread? boolean
--- @field granularity? SteppingGranularity

--- @class StepBackRequest : Request
--- @field arguments StepBackArguments
--- @field new fun(self, seq: number, arguments: StepBackArguments)

return StepBackRequest
