--- @class StoppedEventBody
--- @field reason StoppedEventReason
--- @field description? string
--- @field threadId? number
--- @field preserveFocusHint? boolean
--- @field text? string
--- @field allThreadsStopped? boolean
--- @field hitBreakpointIds? number[]

--- @class StoppedEvent : Event
--- @field body StoppedEventBody
local StoppedEvent = {}
StoppedEvent.__index = StoppedEvent

--- @enum StoppedEventReason
StoppedEvent.Reason = {
	STEP = "step",
	BREAKPOINT = "breakpoint",
	EXCEPTION = "exception",
	PAUSE = "pause",
	ENTRY = "entry",
	GOTO = "goto",
	FUNCTION_BREAKPOINT = "function breakpoint",
	DATA_BREAKPOINT = "data breakpoint",
	INSTRUCTION_BREAKPOINT = "instruction breakpoint",
}

return StoppedEvent
