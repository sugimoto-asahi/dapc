local Request = require("dapc.rpc.Request")

--- @class ThreadsRequest : Request
local ThreadsRequest = Request:new(Request.RequestCommand.THREADS)
ThreadsRequest.__index = ThreadsRequest

--- Constructor
--- @param seq number Sequence number to assign to this request
function ThreadsRequest:new(seq)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	return o
end

return ThreadsRequest
