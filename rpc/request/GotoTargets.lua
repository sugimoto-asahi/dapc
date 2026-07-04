local Request = require("dapc.rpc.request.Request")

--- @class GotoTargetsArguments
--- @field source Source
--- @field line number
--- @field column? number

--- @class GotoTargetsRequest : Request
--- @field arguments GotoTargetsArguments
--- @field new fun(self, seq: number, arguments: GotoTargetsArguments)
local GotoTargetsRequest = Request:new(Request.COMMAND.GOTO_TARGETS)

return GotoTargetsRequest
