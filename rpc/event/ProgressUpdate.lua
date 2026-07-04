--- @class ProgressUpdateEventBody
--- @field progressId string
--- @field message? string
--- @field percentage? number

--- @class ProgressUpdateEvent : Event
--- @field body ProgressUpdateEventBody
local ProgressUpdateEvent = {}

return ProgressUpdateEvent
