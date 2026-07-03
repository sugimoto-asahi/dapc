local Request = require("dapc.rpc.Request")

--- @class ConfigurationDoneArguments

--- @class ConfigurationDoneRequest : Request
--- @field arguments ConfigurationDoneArguments
local ConfigurationDoneRequest = Request:new(Request.RequestCommand.CONFIGURATION_DONE)
ConfigurationDoneRequest.__index = ConfigurationDoneRequest

--- Constructor
--- @param seq number Sequence number to assign to this request
function ConfigurationDoneRequest:new(seq)
	local o = {}
	setmetatable(o, self)
	o.seq = seq
	o.arguments = {}
	return o
end

return ConfigurationDoneRequest
