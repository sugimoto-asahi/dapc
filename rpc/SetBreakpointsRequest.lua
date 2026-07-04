local Request = require("dapc.rpc.Request")

--- @alias SetBreakpointsArgumentsPresentationHint "normal" | "emphasize" | "deemphasize"

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
