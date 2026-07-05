local Event = require("dapc.rpc.event")
local Message = require("dapc.rpc.Message")
local Logger = require("logger")
local Request = require("dapc.rpc.request")
local types = require("dapc.rpc.Types")
local share = require("dapc.share")

--- @class DAP Manager
--- @field current_seq number Current JSON-RPC sequence number
local Manager = {
	current_seq = 1,
}

Manager.Status = {
	got_capabilities = false,
}

--- Get the next usable sequence number for use
function Manager.get_next_seq()
	local current = Manager.current_seq
	Manager.current_seq = Manager.current_seq + 1
	return current
end

--- For a given body content, make a suitable JSON-RPC message
--- @param content table Content
local function to_message(content)
	local content_string = vim.json.encode(content)
	return "Content-Length: " .. #content_string .. "\r\n\r\n" .. content_string
end

--- Initialize the manager
--- @param writer function Callable that writes a string to stdout
function Manager.init(writer)
	Manager.writer = writer
	local init_request = Request.Initialize:new(Manager.get_next_seq(), { adapterID = "lldb-dap" })
	Manager.send_request(init_request)
end

--- Send a request to stdout
--- @param req Request Request to send
function Manager.send_request(req)
	Logger.log("Request: " .. req.command)
	Manager.writer(to_message(req:get_partial()))
end

--- Process a message
--- @param message Message
function Manager.ingest(message)
	if message.type == Message.MessageType.RESPONSE then
		--- @cast message Response
		Manager.process_response(message)
	elseif message.type == Message.MessageType.EVENT then
		--- @cast message Event
		Manager.process_event(message)
	end
end

--- @private
--- Process a response message
--- @param response Response
function Manager.process_response(response)
	Logger.log("Response: " .. response.command)
	if response.command == Request.COMMAND.ATTACH then
		--- @cast response AttachResponse
	elseif response.command == Request.COMMAND.BREAKPOINT_LOCATIONS then
		--- @cast response BreakpointLocationsResponse
	elseif response.command == Request.COMMAND.COMPLETIONS then
		--- @cast response CompletionsResponse
	elseif response.command == Request.COMMAND.CONFIGURATION_DONE then
		--- @cast response ConfigurationDoneResponse
	elseif response.command == Request.COMMAND.CONTINUE then
		--- @cast response ContinueResponse
	elseif response.command == Request.COMMAND.DATA_BREAKPOINT_INFO then
		--- @cast response DataBreakpointInfoResponse
	elseif response.command == Request.COMMAND.DISASSEMBLE then
		--- @cast response DisassembleResponse
	elseif response.command == Request.COMMAND.DISCONNECT then
		--- @cast response DisconnectResponse
	elseif response.command == Request.COMMAND.EVALUATE then
		--- @cast response EvaluateResponse
	elseif response.command == Request.COMMAND.EXCEPTION_INFO then
		--- @cast response ExceptionInfoResponse
	elseif response.command == Request.COMMAND.GOTO then
		--- @cast response GotoResponse
	elseif response.command == Request.COMMAND.GOTO_TARGETS then
		--- @cast response GotoTargetsResponse
	elseif response.command == Request.COMMAND.INITIALIZE then
		--- @cast response InitializeResponse
		local launch_request = Request.Launch:new(Manager.get_next_seq(), {
			name = "lldb-dap",
			type = "lldb-dap",
			request = "launch",
			program = "C:\\Users\\juayh\\Dev\\test\\build\\Debug\\test.exe",
			stopOnEntry = false,
		})
		Manager.send_request(launch_request)
	elseif response.command == Request.COMMAND.LAUNCH then
		--- @cast response LaunchResponse
	elseif response.command == Request.COMMAND.LOADED_SOURCES then
		--- @cast response LoadedSourcesResponse
	elseif response.command == Request.COMMAND.LOCATIONS then
		--- @cast response LocationsResponse
	elseif response.command == Request.COMMAND.MODULES then
		--- @cast response ModulesResponse
	elseif response.command == Request.COMMAND.NEXT then
		--- @cast response NextResponse
	elseif response.command == Request.COMMAND.PAUSE then
		--- @cast response PauseResponse
	elseif response.command == Request.COMMAND.READ_MEMORY then
		--- @cast response ReadMemoryResponse
	elseif response.command == Request.COMMAND.RESTART then
		--- @cast response RestartResponse
	elseif response.command == Request.COMMAND.RESTART_FRAME then
		--- @cast response RestartFrameResponse
	elseif response.command == Request.COMMAND.REVERSE_CONTINUE then
		--- @cast response ReverseContinueResponse
	elseif response.command == Request.COMMAND.SCOPES then
		--- @cast response ScopesResponse
		local reference
		for _, scope in ipairs(response.body.scopes) do
			if scope.presentationHint == "locals" then
				reference = scope.variablesReference
				break
			end
		end
		local variables_request = Request.Variables:new(Manager.get_next_seq(), {
			variablesReference = reference,
		})
		Manager.send_request(variables_request)
	elseif response.command == Request.COMMAND.SET_BREAKPOINTS then
		--- @cast response SetBreakpointsResponse
		Logger.log(response)
		local set_function_breakpoints_req = Request.SetFunctionBreakpoints:new(Manager.get_next_seq(), {
			breakpoints = {},
		})
		Manager.send_request(set_function_breakpoints_req)
	elseif response.command == Request.COMMAND.SET_DATA_BREAKPOINTS then
		--- @cast response SetDataBreakpointsResponse
	elseif response.command == Request.COMMAND.SET_EXCEPTION_BREAKPOINTS then
		--- @cast response SetExceptionBreakpointsResponse
		local config_done_request = Request.ConfigurationDone:new(Manager.get_next_seq(), {})
		Manager.send_request(config_done_request)
	elseif response.command == Request.COMMAND.SET_EXPRESSION then
		--- @cast response SetExpressionResponse
	elseif response.command == Request.COMMAND.SET_FUNCTION_BREAKPOINTS then
		--- @cast response SetFunctionBreakpointsResponse
		local set_exception_breakpoints_req = Request.SetExceptionBreakpoints:new(Manager.get_next_seq(), {
			filters = { "cpp_catch", "cpp_throw" },
		})
		Manager.send_request(set_exception_breakpoints_req)
	elseif response.command == Request.COMMAND.SET_INSTRUCTION_BREAKPOINTS then
		--- @cast response SetInstructionBreakpointsResponse
	elseif response.command == Request.COMMAND.SET_VARIABLE then
		--- @cast response SetVariableResponse
	elseif response.command == Request.COMMAND.SOURCE then
		--- @cast response SourceResponse
	elseif response.command == Request.COMMAND.STACK_TRACE then
		--- @cast response StackTraceResponse
		local first_id = response.body.stackFrames[1].id
		local scopes_request = Request.Scopes:new(Manager.get_next_seq(), {
			frameId = first_id,
		})
		Manager.send_request(scopes_request)
	elseif response.command == Request.COMMAND.STEP_BACK then
		--- @cast response StepBackResponse
	elseif response.command == Request.COMMAND.STEP_IN then
		--- @cast response StepInResponse
	elseif response.command == Request.COMMAND.STEP_IN_TARGETS then
		--- @cast response StepInTargetsResponse
	elseif response.command == Request.COMMAND.STEP_OUT then
		--- @cast response StepOutResponse
	elseif response.command == Request.COMMAND.TERMINATE then
		--- @cast response TerminateResponse
	elseif response.command == Request.COMMAND.TERMINATE_THREADS then
		--- @cast response TerminateThreadsResponse
	elseif response.command == Request.COMMAND.THREADS then
		--- @cast response ThreadsResponse
	elseif response.command == Request.COMMAND.VARIABLES then
		--- @cast response VariablesResponse
	elseif response.command == Request.COMMAND.WRITE_MEMORY then
		--- @cast response WriteMemoryResponse
	end
end

--- @private
--- Process an event message
--- @param event Event
function Manager.process_event(event)
	Logger.log("Event: " .. event.event)
	if event.event == Event.EVENT_TYPE.BREAKPOINT then
		--- @cast event BreakpointEvent
	elseif event.event == Event.EVENT_TYPE.CAPABILILTIES then
		--- @cast event CapabilitiesEvent
	elseif event.event == Event.EVENT_TYPE.CONTINUED then
		--- @cast event ContinuedEvent
	elseif event.event == Event.EVENT_TYPE.EXITED then
		--- @cast event ExitedEvent
	elseif event.event == Event.EVENT_TYPE.INITIALIZED then
		--- @cast event InitializedEvent
		--- @type string, SourceBreakpoint[]

		for path, breakpoints in pairs(share.sources) do
			local breakpoint_sources = {}
			for breakpoint_line, _ in pairs(breakpoints) do
				table.insert(breakpoint_sources, { line = breakpoint_line })
			end
			local set_breakpoints_request = Request.SetBreakpoints:new(Manager.get_next_seq(), {
				source = {
					path = path,
				},
				breakpoints = breakpoint_sources,
			})
			Manager.send_request(set_breakpoints_request)
		end
	elseif event.event == Event.EVENT_TYPE.INVALIDATED then
		--- @cast event InvalidatedEvent
	elseif event.event == Event.EVENT_TYPE.LOADED_SOURCE then
		--- @cast event LoadedSourceEvent
	elseif event.event == Event.EVENT_TYPE.MEMORY then
		--- @cast event MemoryEvent
	elseif event.event == Event.EVENT_TYPE.MODULE then
		--- @cast event ModuleEvent
	elseif event.event == Event.EVENT_TYPE.OUTPUT then
		--- @cast event OutputEvent
	elseif event.event == Event.EVENT_TYPE.PROCESS then
		--- @cast event ProcessEvent
	elseif event.event == Event.EVENT_TYPE.PROGRESS_END then
		--- @cast event ProgressEndEvent
	elseif event.event == Event.EVENT_TYPE.PROGRESS_START then
		--- @cast event ProgressStartEvent
	elseif event.event == Event.EVENT_TYPE.PROGRESS_UPDATE then
		--- @cast event ProgressUpdateEvent
	elseif event.event == Event.EVENT_TYPE.STOPPED then
		if event.body.reason == Event.Stopped.REASON.BREAKPOINT then
			--- @cast event StoppedEvent
			-- We are stopped at one of our breakpoints, so
			-- we start collecting all the stack data for the stopped thread
			local stack_trace_request = Request.StackTrace:new(Manager.get_next_seq(), {
				threadId = event.body.threadId,
			})
			Manager.send_request(stack_trace_request)
		end
	elseif event.event == Event.EVENT_TYPE.TERMINATED then
		--- @cast event TerminatedEvent
	elseif event.event == Event.EVENT_TYPE.THREAD then
		--- @cast event ThreadEvent
	end
end

return Manager
