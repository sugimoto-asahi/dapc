local Request = require("dapc.rpc.request.Request")

--- @class InitializeRequest : Request
--- @field arguments InitializeRequestArguments
local InitializeRequest = Request:new(Request.COMMAND.INITIALIZE)
InitializeRequest.__index = InitializeRequest

--- @enum InitializeRequestArgumentsPathFormat
InitializeRequest.InitializeRequestArgumentsPathFormat = {
	PATH = "path",
	URI = "uri",
}

--- @class InitializeRequestArguments
--- @field clientID? string The ID of the client using this adapter
--- @field clientName? string The human-readable name of the client using this adapter.
--- @field adapterID string The ID of the debug adapter
--- @field locale? string The ISO-639 locale of the client using the adapter.
--- @field linesStartAt1? boolean If true all line numbers are 1-based (default).
--- @field columnsStartAt1? boolean If true all column numbres are 1-based (default).
--- @field pathFormat? InitializeRequestArgumentsPathFormat Determines in what format
---                    paths are specified. The default is "path", which is the native format.
--- @field supportsVariableType? boolean Client supports the "type" attribute for variables.
--- @field supportsVariablePaging? boolean Client supports the paging of variables.
--- @field supportsRunInTerminalRequest? boolean Client supports the "runInTerminal" request.
--- @field supportsMemoryReferences? boolean Client supports memory references.
--- @field supportsProgressReporting? boolean Client supports progress reporting.
--- @field supportsInvalidatedEvent? boolean Client supports the "invalidated" event.
--- @field supportsMemoryEvent? boolean Client supports the "memory" event.
--- @field supportsArgsCanBeInterpretedByShell? boolean Client supports the
---        "argsCanBeInterpretedByShell" attribute on the "runInTerminal" request.
--- @field supportsStartDebuggingRequest? boolean Client supports the "startDebugging" request.
--- @field supportsANSIStyling? boolean The client will interpret ANSI escape sequences
---        in the display of "OutpuptEvent.output" and "Variable.value" fields when
---        "Capabilities.supportsANSIStyling" is also enabled.

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments InitializeRequestArguments
function InitializeRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return InitializeRequest
