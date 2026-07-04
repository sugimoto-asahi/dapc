local Request = require("dapc.rpc.request.Request")

--- @class LaunchRequest : Request
--- @field arguments LaunchRequestArguments
local LaunchRequest = Request:new(Request.COMMAND.LAUNCH)
LaunchRequest.__index = LaunchRequest

--- @class LaunchRequestArguments
--- @field noDebug? boolean
--- @field __restart? any

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments LaunchRequestArguments
function LaunchRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return LaunchRequest
