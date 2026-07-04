local Request = require("dapc.rpc.request.Request")

--- @class GotoArguments
--- @field threadId number
--- @field targetId number

--- @class GotoRequest : Request
--- @field arguments GotoArguments
--- @field new fun(self, seq: number, arguments: GotoArguments)
local GotoRequest = Request:new(Request.COMMAND.GOTO)

return GotoRequest
