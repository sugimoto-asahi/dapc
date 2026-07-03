local Request = require("dapc.rpc.Request")

--- @class ContinueArguments
--- @field threadId number Thread to continue

--- @class ContinueRequest : Request
--- @field arguments ContinueArguments
local ContinueRequest = Request:new(Request.RequestCommand.CONTINUE)
ContinueRequest.__index = ContinueRequest

--- Constructor
--- @param seq number Sequence number to assign to this request
function ContinueRequest:new(seq, arguments)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = arguments
	return o
end

return ContinueRequest
