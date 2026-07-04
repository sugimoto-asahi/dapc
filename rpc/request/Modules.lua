local Request = require("dapc.rpc.request.Request")

local ModulesRequest = Request:new(Request.COMMAND.MODULES)

--- @class ModulesArguments
--- @field startModule? number
--- @field moduleCount? number

--- @class ModulesRequest : Request
--- @field arguments ModulesArguments
--- @field new fun(self, seq: number, arguments: ModulesArguments)

return ModulesRequest
