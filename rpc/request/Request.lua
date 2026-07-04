local Message = require("dapc.rpc.Message")

--- @class Request : Message
--- @field command RequestCommand
--- @field arguments any
local Request = Message:new(Message.MessageType.REQUEST)

--- @enum RequestCommand
Request.COMMAND = {
	NONE = "none", -- nil value
	ATTACH = "attach",
	BREAKPOINT_LOCATIONS = "breakpointLocations",
	COMPLETIONS = "completions",
	CONFIGURATION_DONE = "configurationDone",
	CONTINUE = "continue",
	DATA_BREAKPOINT_INFO = "dataBreakpointInfo",
	DISASSEMBLE = "disassemble",
	DISCONNECT = "disconnect",
	EVALUATE = "evaluate",
	EXCEPTION_INFO = "exceptionInfo",
	GOTO = "goto",
	GOTO_TARGETS = "gotoTargets",
	INITIALIZE = "initialize",
	LAUNCH = "launch",
	LOADED_SOURCES = "loadedSources",
	LOCATIONS = "locations",
	MODULES = "modules",
	NEXT = "next",
	PAUSE = "pause",
	READ_MEMORY = "readMemory",
	RESTART = "restart",
	RESTART_FRAME = "restartFrame",
	REVERSE_CONTINUE = "reverseContinue",
	SCOPES = "scopes",
	SET_BREAKPOINTS = "setBreakpoints",
	SET_DATA_BREAKPOINTS = "setDataBreakpoints",
	SET_EXCEPTION_BREAKPOINTS = "setExceptionBreakpoints",
	SET_EXPRESSION = "setExpression",
	SET_FUNCTION_BREAKPOINTS = "setFunctionBreakpoints",
	SET_INSTRUCTION_BREAKPOINTS = "setInstructionBreakpoints",
	SET_VARIABLE = "setVariable",
	SOURCE = "source",
	STACK_TRACE = "stackTrace",
	STEP_BACK = "stepBack",
	STEP_IN = "stepIn",
	STEP_IN_TARGETS = "stepInTargets",
	STEP_OUT = "stepOut",
	TERMINATE = "terminate",
	TERMINATE_THREADS = "terminateThreads",
	THREADS = "threads",
	VARIABLES = "variables",
	WRITE_MEMORY = "writeMemory",
}

--- Constructor
--- @overload fun(cmd_or_seq: number, arguments?: any)
--- @param cmd_or_seq RequestCommand
--- @note When called with a single argument, it must be a RequestCommand.
--- This invocation is used to subclass the Request class into one of the
--- several concrete request classes.
--- When called with two arguments, the arguments are (seq, arguments), where
--- seq is the sequence number to assign to this message, and arguments is the
--- table of arguments for this request. This invocation should only be invoked
--- by users looking to create instances of concrete request classes.
function Request:new(cmd_or_seq, arguments)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	if arguments == nil then
		--- 1 argument
		o.command = cmd_or_seq
	else
		--- 2 arguments
		o.seq = cmd_or_seq
		o.arguments = arguments
	end
	return o
end

function Request:get_partial()
	local message_partial = getmetatable(Request).get_partial(self)
	local request_partial = {
		command = self.command,
		arguments = self.arguments,
	}
	return vim.tbl_deep_extend("force", message_partial, request_partial)
end

return Request
