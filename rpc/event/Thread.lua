--- @class ThreadEventBody
--- @field reason ThreadEventReason
--- @field threadId number

--- @class ThreadEvent : Event
--- @field body ThreadEventBody
local ThreadEvent = {}

--- @enum ThreadEventReason
ThreadEvent.REASON = {
	STARTED = "started",
	EXITED = "exited",
}

return ThreadEvent
