local Request = require("dapc.rpc.request.Request")

--- @class ConfigurationDoneArguments

--- @class ConfigurationDoneRequest : Request
--- @field arguments ConfigurationDoneArguments
--- @field new fun(self, seq: number, arguments : ConfigurationDoneArguments)
local ConfigurationDoneRequest = Request:new(Request.COMMAND.CONFIGURATION_DONE)

return ConfigurationDoneRequest
