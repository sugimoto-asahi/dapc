local Request = require("dapc.rpc.request.Request")

local ScopesRequest = Request:new(Request.COMMAND.SCOPES)

--- @class ScopesArguments
--- @field frameId number

--- @class ScopesRequest : Request
--- @field arguments ScopesArguments
--- @field new fun(self, seq: number, arguments: ScopesArguments)

return ScopesRequest
