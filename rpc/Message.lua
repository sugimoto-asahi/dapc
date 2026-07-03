--- @class Message
--- @field seq integer Sequence number of message
--- @field type MessageType Type of JSON-RPC message
--- @field content table Body content of message

local Message = {}
Message.__index = Message

--- @enum MessageType
Message.MessageType = {
	NONE = "none", -- nil value
	REQUEST = "request",
	RESPONSE = "response",
	EVENT = "event",
	STRING = "string",
}

--- Class field defaults
Message.seq = 1
Message.type = Message.MessageType.NONE

--- Constructor
--- @param type MessageType The type of message
function Message:new(type)
	local o = {}
	setmetatable(o, self)

	o.type = type
	return o
end

function Message:get_partial()
	return {
		seq = self.seq,
		type = self.type,
	}
end

return Message
