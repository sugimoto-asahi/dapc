local Message = require("dapc.rpc.Message")

--- @class Event : Message
--- @field event EventType
--- @field body? any
local Event = {}

--- @enum EventType
Event.EVENT_TYPE = {
	BREAKPOINT = "breakpoint",
	CAPABILILTIES = "capabilities",
	CONTINUED = "continued",
	EXITED = "exited",
	INITIALIZED = "initialized",
	INVALIDATED = "invalidated",
	LOADEDSOURCE = "loadedsource",
	MEMORY = "memory",
	MODULE = "module",
	OUTPUT = "output",
	PROCESS = "process",
	PROGRESSEND = "progessend",
	PROGRESSSTART = "progressstart",
	PROGRESSUPDATE = "progressupdate",
	STOPPED = "stopped",
	TERMINATED = "terminated",
	THREAD = "thread",
}

return Event
