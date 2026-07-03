local Response = require("dapc.rpc.Response")

--- @class ExceptionBreakpointFilter
--- @field filter string
--- @field label string
--- @field description? string
--- @field default? boolean
--- @field supportsCondition? boolean
--- @field conditionDescription? string

--- @alias ColumnDescriptorType "string" | "number" | "boolean" | "unixTimestampUTC"

--- @class ColumnDescriptor
--- @field attributeName string
--- @field label string
--- @field format? string
--- @field ColumnDescriptorType? type
--- @field width? number

--- @alias BreakpointModeApplicability "source" | "exception" | "data" | "instruction" | "string"

--- @class BreakpointMode
--- @field mode string
--- @field label string
--- @field description? string
--- @field appliesTo BreakpointModeApplicability[]

--- @class Capabilities
--- @field supportsConfigurationDoneRequest? boolean
--- @field supportsFunctionBreakpoints? boolean
--- @field supportsConditionalBreakpoints? boolean
--- @field supportsHitConditionalBreakpoints? boolean
--- @field supportsEvaluateForHovers? boolean
--- @field exceptionBreakpointFilters? ExceptionBreakpointFilter[]
--- @field supportsStepBack? boolean
--- @field supportsSetVariable? boolean
--- @field supportsRestartFrame? boolean
--- @field supportsGotoTargetsRequest? boolean
--- @field supportsStepInTargetsRequest? boolean
--- @field supportsCompletionsRequest? boolean
--- @field completionTriggerCharacters? string[]
--- @field supportsModulesRequest? boolean
--- @field additionalModuleColumns? ColumnDescriptor[]
--- @field supportedChecksumAlgorithms? ChecksumAlgorithm[]
--- @field supportsRestartRequest? boolean
--- @field supportsExceptionOptions? boolean
--- @field supportsExceptionInfoRequest? boolean
--- @field supportTerminateDebuggee? boolean
--- @field supportSuspendDebuggee? boolean
--- @field supportsDelayedStackTraceLoading? boolean
--- @field supportsLoadedSourcesRequest? boolean
--- @field supportsLogPoints? boolean
--- @field supportsTerminateThreadsRequest? boolean
--- @field supportsSetExpression? boolean
--- @field supportsTerminateRequest? boolean
--- @field supportsDataBreakpoints? boolean
--- @field supportsReadMemoryRequest? boolean
--- @field supportsWriteMemoryRequest? boolean
--- @field supportsDisassembleRequest? boolean
--- @field supportsCancelRequest? boolean
--- @field supportsBreakpointLocationsRequest? boolean
--- @field supportsClipboardContext? boolean
--- @field supportsSteppingGranularity? boolean
--- @field supportsInstructionBreakpoints? boolean
--- @field supportsExceptionFilterOptions? boolean
--- @field supportsSingleThreadExecutionRequests? boolean
--- @field supportsDataBreakpointBytes? boolean
--- @field breakpointModes? BreakpointMode[]
--- @field supportsANSIStylign? boolean

--- @class InitializeResponse : Response
--- @field body Capabilities
local InitializeResponse = {}

return InitializeResponse
