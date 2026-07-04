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
	LOADED_SOURCE = "loadedSource",
	MEMORY = "memory",
	MODULE = "module",
	OUTPUT = "output",
	PROCESS = "process",
	PROGRESS_END = "progressEnd",
	PROGRESS_START = "progressStart",
	PROGRESS_UPDATE = "progressUpdate",
	STOPPED = "stopped",
	TERMINATED = "terminated",
	THREAD = "thread",
}

return Event
