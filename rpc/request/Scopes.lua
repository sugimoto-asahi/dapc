local Request = require("dapc.rpc.request.Request")

--- @class ScopesArguments
--- @field frameId number

--- @class ScopesRequest : Request
local ScopesRequest = Request:new(Request.COMMAND.SCOPES)
ScopesRequest.__index = ScopesRequest

--- Constructor
--- @param seq number Sequence number to assign to this request
--- @param arguments ScopesArguments
function ScopesRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return ScopesRequest
