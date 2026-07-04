local Request = require("dapc.rpc.request.Request")

local InitializeRequest = Request:new(Request.COMMAND.INITIALIZE)

--- @enum InitializeRequestArgumentsPathFormat
InitializeRequest.InitializeRequestArgumentsPathFormat = {
	PATH = "path",
	URI = "uri",
}

--- @class InitializeRequestArguments
--- @field clientID? string
--- @field clientName? string
--- @field adapterID string
--- @field locale? string
--- @field linesStartAt1? boolean
--- @field columnsStartAt1? boolean
--- @field pathFormat? InitializeRequestArgumentsPathFormat
--- @field supportsVariableType? boolean
--- @field supportsVariablePaging? boolean
--- @field supportsRunInTerminalRequest? boolean
--- @field supportsMemoryReferences? boolean
--- @field supportsProgressReporting? boolean
--- @field supportsInvalidatedEvent? boolean
--- @field supportsMemoryEvent? boolean
--- @field supportsArgsCanBeInterpretedByShell? boolean
--- @field supportsStartDebuggingRequest? boolean
--- @field supportsANSIStyling? boolean

--- @class InitializeRequest : Request
--- @field arguments InitializeRequestArguments
--- @field new fun(self, seq: number, arguments: InitializeRequestArguments)

return InitializeRequest
