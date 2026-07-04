local Request = require("dapc.rpc.request.Request")

local LocationsRequest = Request:new(Request.COMMAND.LOCATIONS)

--- @class LocationsArguments
--- @field locationReference number

--- @class LocationsRequest : Request
--- @field arguments LocationsArguments
--- @field new fun(self, seq: number, arguments: LocationsArguments)

return LocationsRequest
