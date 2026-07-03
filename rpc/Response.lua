local Message = require("dapc.rpc.Message")

--- @class Response : Message
--- @field request_seq number
--- @field success boolean
--- @field command RequestCommand
--- @field message? ResponseMessage
--- @field body? any
local Response = {}

--- @enum ResponseMessage
Response.ResponseMessage = {
	CANCELLED = "cancelled",
	NOTSTOPPED = "notstopped",
}

return Response
