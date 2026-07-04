local Request = require("dapc.rpc.request.Request")

--- @class CompletionsArguments
--- @field frameId? number
--- @field text string
--- @field column number
--- @field line? number

--- @class CompletionsRequest : Request
--- @field arguments CompletionsArguments
--- @field new fun(self, seq: number, arguments : CompletionsArguments)
local CompletionsRequest = Request:new(Request.COMMAND.COMPLETIONS)

return CompletionsRequest
