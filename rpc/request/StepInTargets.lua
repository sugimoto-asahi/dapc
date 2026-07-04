local Request = require("dapc.rpc.request.Request")

local StepInTargetsRequest = Request:new(Request.COMMAND.STEP_IN_TARGETS)

--- @class StepInTargetsArguments
--- @field frameId number

--- @class StepInTargetsRequest : Request
--- @field arguments StepInTargetsArguments
--- @field new fun(self, seq: number, arguments: StepInTargetsArguments)

return StepInTargetsRequest
