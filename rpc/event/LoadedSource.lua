--- @class LoadedSourceEventBody
--- @field reason LoadedSourceEventReason
--- @field source Source

--- @class LoadedSourceEvent : Event
--- @field body LoadedSourceEventBody
local LoadedSourceEvent = {}

--- @enum LoadedSourceEventReason
LoadedSourceEvent.REASON = {
	NEW = "new",
	CHANGED = "changed",
	REMOVED = "removed",
}

return LoadedSourceEvent
