local Request = require("dapc.rpc.request.Request")

local SetVariableRequest = Request:new(Request.COMMAND.SET_VARIABLE)

--- @class SetVariableArguments
--- @field variablesReference number
--- @field name string
--- @field value string
--- @field format? ValueFormat

--- @class SetVariableRequest : Request
--- @field arguments SetVariableArguments
--- @field new fun(self, seq: number, arguments: SetVariableArguments)

return SetVariableRequest
