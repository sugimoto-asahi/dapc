local Request = require("dapc.rpc.Request")

--- @alias SetBreakpointsArgumentsPresentationHint "normal" | "emphasize" | "deemphasize"

--- @class Source
--- @field name? string
--- @field path? string
--- @field sourceReference? number
--- @field presentationHint? SetBreakpointsArgumentsPresentationHint
--- @field origin? string
--- @field sources? Source[]
--- @field adapterData? any
--- @field checksums? Checksum[]

--- @class SourceBreakpoint
--- @field line number
--- @field column? number
--- @field condition? string
--- @field hitCondition? string
--- @field logMessage? string
--- @field mode? string

--- @class SetBreakpointsArguments
--- @field source Source
--- @field breakpoints? SourceBreakpoint[]
--- @field lines? number[] DEPRECATED
--- @field sourceModified? boolean

--- @class SetBreakpointsRequest : Request
--- @field arguments SetBreakpointsArguments
local SetBreakpointsRequest = Request:new(Request.RequestCommand.SET_BREAKPOINTS)
SetBreakpointsRequest.__index = SetBreakpointsRequest

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments SetBreakpointsArguments
function SetBreakpointsRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return SetBreakpointsRequest
