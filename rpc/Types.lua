local M = {}
------------------
--- Breakpoint ---
------------------
--- @enum BreakpointReason
M.BREAKPOINT_REASON = {
	PENDING = "pending",
	FAILED = "failed",
}

--- @class Breakpoint
--- @field id? number
--- @field verified boolean
--- @field message? string
--- @field source? Source
--- @field line? number
--- @field column? number
--- @field endLine? number
--- @field endColumn? number
--- @field instructionReference? string
--- @field offset? number
--- @field reason? BreakpointReason

--------------------------
--- BreakpointLocation ---
--------------------------

--- @class BreakpointLocation
--- @field line number
--- @field column? number
--- @field endLine? number
--- @field endColumn? number

----------------------
--- BreakpointMode ---
----------------------
--- @class BreakpointMode
--- @field mode string
--- @field label string
--- @field description? string
--- @field appliesTo BreakpointModeApplicability[]

----------------------------------
--- BreakpointModeApplicability ---
----------------------------------
--- @enum BreakpointModeApplicability
M.BREAKPOINT_MODE_APPLICABILITY = {
	SOURCE = "source",
	EXCEPTION = "exception",
	DATA = "data",
	INSTRUCTION = "instruction",
}
--------------------
--- Capabilities ---
--------------------
--- @class Capabilities
--- @field supportsConfigurationDoneRequest? boolean
--- @field supportsFunctionBreakpoints? boolean
--- @field supportsConditionalBreakpoints? boolean
--- @field supportsHitConditionalBreakpoints? boolean
--- @field supportsEvaluateForHovers? boolean
--- @field exceptionBreakpointFilters? ExceptionBreakpointsFilter[]
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
--- @field supportsValueFormattingOptions? boolean
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
--- @field supportsANSIStyling? boolean

----------------
--- Checksum ---
----------------
--- @class Checksum
--- @field algorithm ChecksumAlgorithm
--- @field checksum string

-------------------------
--- ChecksumAlgorithm ---
-------------------------
--- @enum ChecksumAlgorithm
M.CHECKSUM_ALGORITHM = {
	MD5 = "MD5",
	SHA1 = "SHA1",
	SHA256 = "SHA256",
	TIMESTAMP = "timestamp",
}
------------------------
--- ColumnDescriptor ---
------------------------
--- @enum ColumnDescriptorType
M.COLUMN_DESCRIPTOR_TYPE = {
	STRING = "string",
	NUMBER = "number",
	BOOLEAN = "boolean",
	UNIX_TIMESTAMP_UTC = "unixTimestampUTC",
}
--- @class ColumnDescriptor
--- @field attributeName string
--- @field label string
--- @field format? string
--- @field type? ColumnDescriptorType
--- @field width? number

----------------------
--- CompletionItem ---
----------------------
--- @class CompletionItem
--- @field label string
--- @field text? string
--- @field sortText? string
--- @field detail? string
--- @field type? CompletionItemType
--- @field start? number
--- @field length? number
--- @field selectionStart? number
--- @field selectionLength? number

--------------------------
--- CompletionItemType ---
--------------------------
--- @enum CompletionItemType
M.COMPLETION_ITEM_TYPE = {
	METHOD = "method",
	FUNCTION = "function",
	CONSTRUCTOR = "constructor",
	FIELD = "field",
	VARIABLE = "variable",
	CLASS = "class",
	INTERFACE = "interface",
	MODULE = "module",
	PROPERTY = "property",
	UNIT = "unit",
	VALUE = "value",
	ENUM = "enum",
	KEYWORD = "keyword",
	SNIPPET = "snippet",
	TEXT = "text",
	COLOR = "color",
	FILE = "file",
	REFERENCE = "reference",
	CUSTOMCOLOR = "customcolor",
}

----------------------
--- DataBreakpoint ---
----------------------
--- @class DataBreakpoint
--- @field dataId string
--- @field accessType? DataBreakpointAccessType
--- @field condition? string
--- @field hitCondition? string

------------------------------
--- DataBreakpointAccessType ---
------------------------------
--- @enum DataBreakpointAccessType
M.DATA_BREAKPOINT_ACCESS_TYPE = {
	READ = "read",
	WRITE = "write",
	READ_WRITE = "readWrite",
}

-------------------------------
--- DisassembledInstruction ---
-------------------------------
--- @enum DisassembledInstructionPresentationHint
M.DISASSEMBLED_INSTRUCTION_PRESENTATION_HINT = {
	NORMAL = "normal",
	INVALID = "invalid",
}

--- @class DisassembledInstruction
--- @field address string
--- @field instructionBytes? string
--- @field instruction string
--- @field symbol? string
--- @field location? Source
--- @field line? number
--- @field column? number
--- @field endLine? number
--- @field endColumn? number
--- @field presentationHint? DisassembledInstructionPresentationHint

--------------------------
--- ExceptionBreakMode ---
--------------------------
--- @enum ExceptionBreakMode
M.EXCEPTION_BREAK_MODE = {
	NEVER = "never",
	ALWAYS = "always",
	UNHANDLED = "unhandled",
	USER_UNHANDLED = "userUnhandled",
}

----------------------------------
--- ExceptionBreakpointsFilter ---
----------------------------------
--- @class ExceptionBreakpointsFilter
--- @field filter string
--- @field label string
--- @field description? string
--- @field default? boolean
--- @field supportsCondition? boolean
--- @field conditionDescription? string

------------------------
--- ExceptionDetails ---
------------------------
--- @class ExceptionDetails
--- @field message? string
--- @field typeName? string
--- @field fullTypeName? string
--- @field evaluateName? string
--- @field stackTrace? string
--- @field innerException? ExceptionDetails[]

------------------------------
--- ExceptionFilterOptions ---
------------------------------
--- @class ExceptionFilterOptions
--- @field filterId string
--- @field condition? string
--- @field mode? string

------------------------
--- ExceptionOptions ---
------------------------
--- @class ExceptionOptions
--- @field path? ExceptionPathSegment[]
--- @field breakMode ExceptionBreakMode

----------------------------
--- ExceptionPathSegment ---
----------------------------
--- @class ExceptionPathSegment
--- @field negate? boolean
--- @field names string[]

--------------------------
--- FunctionBreakpoint ---
--------------------------
--- @class FunctionBreakpoint
--- @field name string
--- @field condition? string
--- @field hitCondition? string

------------------
--- GotoTarget ---
------------------
--- @class GotoTarget
--- @field id number
--- @field label string
--- @field line number
--- @field column? number
--- @field endLine? number
--- @field endColumn? number
--- @field instructionPointerReference? string

-----------------------------
--- InstructionBreakpoint ---
-----------------------------
--- @class InstructionBreakpoint
--- @field instructionReference string
--- @field offset? number
--- @field condition? string
--- @field hitCondition? string
--- @field mode? string

------------------------
--- InvalidatedAreas ---
------------------------
--- @enum InvalidatedAreas
M.INVALIDATED_AREAS = {
	ALL = "all",
	STACKS = "stacks",
	THREADS = "threads",
	VARIABLES = "variables",
}

---------------
--- Message ---
---------------
--- @class Message
--- @field id number
--- @field format string
--- @field variables? table<string, string>
--- @field sendTelemetry? boolean
--- @field showUser? boolean
--- @field url? string
--- @field urlLabel? string

--------------
--- Module ---
--------------
--- @class Module
--- @field id number | string
--- @field name string
--- @field path? string
--- @field isOptimized? boolean
--- @field isUserCode? boolean
--- @field version? string
--- @field symbolStatus? string
--- @field symbolFilePath? string
--- @field dateTimeStamp? string
--- @field addressRange? string

-------------
--- Scope ---
-------------
--- @enum ScopePresentationHint
M.SCOPE_PRESENTATION_HINT = {
	ARGUMENTS = "arguments",
	LOCALS = "locals",
	REGISTERS = "registers",
	RETURN_VALUE = "returnValue",
}

--- @class Scope
--- @field name string
--- @field presentationHint? ScopePresentationHint
--- @field variablesReference number
--- @field namedVariables? number
--- @field indexedVariables? number
--- @field expensive boolean
--- @field source? Source
--- @field line? number
--- @field column? number
--- @field endLine? number
--- @field endColumn? number

--------------
--- Source ---
--------------
--- @enum SourcePresentationHint
M.SOURCE_PRESENTATION_HINT = {
	NORMAL = "normal",
	EMPHASIZE = "emphasize",
	DEEMPHASIZE = "deemphasize",
}

--- @class Source
--- @field name? string
--- @field path? string
--- @field sourceReference? number
--- @field presentationHint? SourcePresentationHint
--- @field origin? string
--- @field sources? Source[]
--- @field adapterData? any
--- @field checksums? Checksum[]

------------------------
--- SourceBreakpoint ---
------------------------
--- @class SourceBreakpoint
--- @field line number
--- @field column? number
--- @field condition? string
--- @field hitCondition? string
--- @field logMessage? string
--- @field mode? string

------------------
--- StackFrame ---
------------------
--- @enum StackFramePresentationHint
M.STACK_FRAME_PRESENTATION_HINT = {
	NORMAL = "normal",
	LABEL = "label",
	SUBTLE = "subtle",
}

--- @class StackFrame
--- @field id number
--- @field name string
--- @field source? Source
--- @field line number
--- @field column number
--- @field endLine? number
--- @field endColumn? number
--- @field canRestart? boolean
--- @field instructionPointerReference? string
--- @field moduleId? number | string
--- @field presentationHint? StackFramePresentationHint

------------------------
--- StackFrameFormat ---
------------------------
--- @class StackFrameFormat : ValueFormat
--- @field parameters? boolean
--- @field parameterTypes? boolean
--- @field parameterNames? boolean
--- @field parameterValues? boolean
--- @field line? boolean
--- @field module? boolean
--- @field includeAll? boolean

--------------------
--- StepInTarget ---
--------------------
--- @class StepInTarget
--- @field id number
--- @field label string
--- @field line? number
--- @field column? number
--- @field endLine? number
--- @field endColumn? number

---------------------------
--- SteppingGranularity ---
---------------------------
--- @enum SteppingGranularity
M.STEPPING_GRANULARITY = {
	STATEMENT = "statement",
	LINE = "line",
	INSTRUCTION = "instruction",
}

--------------
--- Thread ---
--------------
--- @class Thread
--- @field id number
--- @field name string

-------------------
--- ValueFormat ---
-------------------
--- @class ValueFormat
--- @field hex? boolean

----------------
--- Variable ---
----------------
--- @class Variable
--- @field name string
--- @field value string
--- @field type? string
--- @field presentationHint? VariablePresentationHint
--- @field evaluateName? string
--- @field variablesReference number
--- @field namedVariables? number
--- @field indexedVariables? number
--- @field memoryReference? string
--- @field declarationLocationReference? number
--- @field valueLocationReference? number

--------------------------------
--- VariablePresentationHint ---
--------------------------------
--- @enum VariablePresentationHintKind
M.VARIABLE_PRESENTATION_HINT_KIND = {
	PROPERTY = "property",
	METHOD = "method",
	CLASS = "class",
	DATA = "data",
	EVENT = "event",
	BASE_CLASS = "baseClass",
	INNER_CLASS = "innerClass",
	INTERFACE = "interface",
	MOST_DERIVED_CLASS = "mostDerivedClass",
	VIRTUAL = "virtual",
	DATA_BREAKPOINT = "dataBreakpoint",
}

--- @enum VariablePresentationHintAttributes
M.VARIABLE_PRESENTATION_HINT_ATTRIBUTES = {
	STATIC = "static",
	CONSTANT = "constant",
	READ_ONLY = "readOnly",
	RAW_STRING = "rawString",
	HAS_OBJECT_ID = "hasObjectId",
	CAN_HAVE_OBJECT_ID = "canHaveObjectId",
	HAS_SIDE_EFFECTS = "hasSideEffects",
	HAS_DATA_BREAKPOINT = "hasDataBreakpoint",
}

--- @enum VariablePresentationHintVisibility
M.VARIABLE_PRESENTATION_HINT_VISIBILITY = {
	PUBLIC = "public",
	PRIVATE = "private",
	PROTECTED = "protected",
	INTERNAL = "internal",
	FINAL = "final",
}

--- @class VariablePresentationHint
--- @field kind? VariablePresentationHintKind
--- @field attributes? VariablePresentationHintAttributes[]
--- @field visibility? VariablePresentationHintVisibility
--- @field lazy? boolean

return M
