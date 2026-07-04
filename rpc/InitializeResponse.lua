local Response = require("dapc.rpc.Response")

--- @class ExceptionBreakpointFilter
--- @field filter string
--- @field label string
--- @field description? string
--- @field default? boolean
--- @field supportsCondition? boolean
--- @field conditionDescription? string

--- @class InitializeResponse : Response
--- @field body Capabilities
local InitializeResponse = {}

return InitializeResponse
