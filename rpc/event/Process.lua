--- @class ProcessEventBody
--- @field name string
--- @field systemProcessId? number
--- @field isLocalProcess? boolean
--- @field startMethod? ProcessEventStartMethod
--- @field pointerSize? number

--- @class ProcessEvent : Event
--- @field body ProcessEventBody
local ProcessEvent = {}

--- @enum ProcessEventStartMethod
ProcessEvent.START_METHOD = {
	LAUNCH = "launch",
	ATTACH = "attach",
	ATTACH_FOR_SUSPENDED_LAUNCH = "attachForSuspendedLaunch",
}

return ProcessEvent
