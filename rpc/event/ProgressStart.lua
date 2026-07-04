--- @class ProgressStartEventBody
--- @field progressId string
--- @field title string
--- @field requestId? number
--- @field cancellable? boolean
--- @field message? string
--- @field percentage? number

--- @class ProgressStartEvent : Event
--- @field body ProgressStartEventBody
local ProgressStartEvent = {}

return ProgressStartEvent
