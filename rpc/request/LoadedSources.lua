local Request = require("dapc.rpc.request.Request")

local LoadedSourcesRequest = Request:new(Request.COMMAND.LOADED_SOURCES)

--- @class LoadedSourcesArguments

--- @class LoadedSourcesRequest : Request
--- @field arguments LoadedSourcesArguments
--- @field new fun(self, seq: number, arguments: LoadedSourcesArguments)

return LoadedSourcesRequest
