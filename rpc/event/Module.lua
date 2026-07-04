--- @class ModuleEventBody
--- @field reason ModuleEventReason
--- @field module Module

--- @class ModuleEvent : Event
--- @field body ModuleEventBody
local ModuleEvent = {}

--- @enum ModuleEventReason
ModuleEvent.REASON = {
	NEW = "new",
	CHANGED = "changed",
	REMOVED = "removed",
}

return ModuleEvent
