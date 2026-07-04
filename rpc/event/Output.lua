--- @class OutputEventBody
--- @field category? OutputEventCategory
--- @field output string
--- @field group? OutputEventGroup
--- @field variablesReference? number
--- @field source? Source
--- @field line? number
--- @field column? number
--- @field data? any
--- @field locationReference? number

--- @class OutputEvent : Event
--- @field body OutputEventBody
local OutputEvent = {}

--- @enum OutputEventCategory
OutputEvent.CATEGORY = {
	CONSOLE = "console",
	IMPORTANT = "important",
	STDOUT = "stdout",
	STDERR = "stderr",
	TELEMETRY = "telemetry",
}

--- @enum OutputEventGroup
OutputEvent.GROUP = {
	START = "start",
	START_COLLAPSED = "startCollapsed",
	END = "end",
}

return OutputEvent
