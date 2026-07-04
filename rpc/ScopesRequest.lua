local Request = require("dapc.rpc.Request")

--- @class ScopesArguments
--- @field frameId number

--- @class ScopesRequest : Request
local ScopesRequest = Request:new(Request.RequestCommand.SCOPES)
ScopesRequest.__index = ScopesRequest

--- @class ScopesResponseBody
--- @field scopes Scope[]

--- @class ScopesResponse : Response
--- @field body ScopesResponseBody

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
