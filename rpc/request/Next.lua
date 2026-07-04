local Request = require("dapc.rpc.request.Request")

local NextRequest = Request:new(Request.COMMAND.NEXT)

--- @class NextArguments
--- @field threadId number
--- @field singleThread? boolean
--- @field granularity? SteppingGranularity

--- @class NextRequest : Request
--- @field arguments NextArguments
--- @field new fun(self, seq: number, arguments: NextArguments)

return NextRequest
