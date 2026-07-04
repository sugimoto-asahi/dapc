local Request = require("dapc.rpc.request.Request")

--- @class AttachRequestArguments
--- @field __restart? any

--- @class AttachRequest : Request
--- @field arguments AttachRequestArguments
--- @field new fun(self, seq: number, arguments : AttachRequestArguments)
local AttachRequest = Request:new(Request.COMMAND.ATTACH)

return AttachRequest
