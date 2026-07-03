local Request = require("dapc.rpc.Request")

--- @class ExceptionFilterOptions
--- @field filterId string
--- @field condition? string
--- @field mode? string

--- @class ExceptionPathSegment
--- @field negate? boolean
--- @field names string[]

--- @alias ExceptionBreakMode "never" | "always" | "unhandled" | "userUnhandled"

--- @class ExceptionOptions
--- @field path? ExceptionPathSegment[]
--- @field breakMode ExceptionBreakMode

--- @class SetExceptionBreakpointsArguments
--- @field filters string[]
--- @field filterOptions? ExceptionFilterOptions[]
--- @field exceptionOptions? ExceptionOptions[]

--- @class SetExceptionBreakpointsRequest : Request
--- @field arguments SetExceptionBreakpointsArguments
local SetExceptionBreakpointsRequest = Request:new(Request.RequestCommand.SET_EXCEPTION_BREAKPOINTS)
SetExceptionBreakpointsRequest.__index = SetExceptionBreakpointsRequest

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments SetExceptionBreakpointsArguments
function SetExceptionBreakpointsRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return SetExceptionBreakpointsRequest
