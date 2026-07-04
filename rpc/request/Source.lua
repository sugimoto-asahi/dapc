local Request = require("dapc.rpc.request.Request")

local SourceRequest = Request:new(Request.COMMAND.SOURCE)

--- @class SourceArguments
--- @field source? Source
--- @field sourceReference number

--- @class SourceRequest : Request
--- @field arguments SourceArguments
--- @field new fun(self, seq: number, arguments: SourceArguments)

return SourceRequest
