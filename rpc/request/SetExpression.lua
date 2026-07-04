local Request = require("dapc.rpc.request.Request")

local SetExpressionRequest = Request:new(Request.COMMAND.SET_EXPRESSION)

--- @class SetExpressionArguments
--- @field expression string
--- @field value string
--- @field frameId? number
--- @field format? ValueFormat

--- @class SetExpressionRequest : Request
--- @field arguments SetExpressionArguments
--- @field new fun(self, seq: number, arguments: SetExpressionArguments)

return SetExpressionRequest
