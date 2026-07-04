--- @class BreakpointEventBody
--- @field reason BreakpointEventReason
--- @field breakpoint Breakpoint

--- @class BreakpointEvent : Event
--- @field body BreakpointEventBody
local BreakpointEvent = {}

--- @enum BreakpointEventReason
BreakpointEvent.REASON = {
	CHANGED = "changed",
	NEW = "new",
	REMOVED = "removed",
}

return BreakpointEvent
