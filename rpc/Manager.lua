local Event = require("dapc.rpc.Event")
local Message = require("dapc.rpc.Message")
local StoppedEvent = require("dapc.rpc.StoppedEvent")
local Logger = require("logger")
local request = require("dapc.rpc.request")

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
	local init_request = request.Initialize:new(Manager.get_next_seq(), { adapterID = "lldb-dap" })
	Manager.send_request(init_request)
end

--- Send a request to stdout
--- @param req Request Request to send
function Manager.send_request(req)
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
	Logger.log("Response to command: " .. response.command)
	if response.command == request.COMMAND.ATTACH then
		--- @cast response AttachResponse
	elseif response.command == request.COMMAND.BREAKPOINT_LOCATIONS then
		--- @cast response BreakpointLocationsResponse
	elseif response.command == request.COMMAND.COMPLETIONS then
		--- @cast response CompletionsResponse
	elseif response.command == request.COMMAND.CONFIGURATION_DONE then
		--- @cast response ConfigurationDoneResponse
	elseif response.command == request.COMMAND.CONTINUE then
		--- @cast response ContinueResponse
	elseif response.command == request.COMMAND.DATA_BREAKPOINT_INFO then
		--- @cast response DataBreakpointInfoResponse
	elseif response.command == request.COMMAND.DISASSEMBLE then
		--- @cast response DisassembleResponse
	elseif response.command == request.COMMAND.DISCONNECT then
		--- @cast response DisconnectResponse
	elseif response.command == request.COMMAND.EVALUATE then
		--- @cast response EvaluateResponse
	elseif response.command == request.COMMAND.EXCEPTION_INFO then
		--- @cast response ExceptionInfoResponse
	elseif response.command == request.COMMAND.GOTO then
		--- @cast response GotoResponse
	elseif response.command == request.COMMAND.GOTO_TARGETS then
		--- @cast response GotoTargetsResponse
	elseif response.command == request.COMMAND.INITIALIZE then
		--- @cast response InitializeResponse
		local launch_request = request.Launch:new(Manager.get_next_seq(), {
			name = "lldb-dap",
			type = "lldb-dap",
			request = "launch",
			program = "C:\\Users\\juayh\\Dev\\test\\build\\Debug\\test.exe",
			stopOnEntry = false,
		})
		Manager.send_request(launch_request)
	elseif response.command == request.COMMAND.LAUNCH then
		--- @cast response LaunchResponse
	elseif response.command == request.COMMAND.LOADED_SOURCES then
		--- @cast response LoadedSourcesResponse
	elseif response.command == request.COMMAND.LOCATIONS then
		--- @cast response LocationsResponse
	elseif response.command == request.COMMAND.MODULES then
		--- @cast response ModulesResponse
	elseif response.command == request.COMMAND.NEXT then
		--- @cast response NextResponse
	elseif response.command == request.COMMAND.PAUSE then
		--- @cast response PauseResponse
	elseif response.command == request.COMMAND.READ_MEMORY then
		--- @cast response ReadMemoryResponse
	elseif response.command == request.COMMAND.RESTART then
		--- @cast response RestartResponse
	elseif response.command == request.COMMAND.RESTART_FRAME then
		--- @cast response RestartFrameResponse
	elseif response.command == request.COMMAND.REVERSE_CONTINUE then
		--- @cast response ReverseContinueResponse
	elseif response.command == request.COMMAND.SCOPES then
		--- @cast response ScopesResponse
		local reference
		for _, scope in ipairs(response.body.scopes) do
			if scope.presentationHint == "locals" then
				reference = scope.variablesReference
				break
			end
		end
		local variables_request = request.Variables:new(Manager.get_next_seq(), {
			variablesReference = reference,
		})
		Manager.send_request(variables_request)
	elseif response.command == request.COMMAND.SET_BREAKPOINTS then
		--- @cast response SetBreakpointsResponse
		local set_function_breakpoints_req = request.SetFunctionBreakpoints:new(Manager.get_next_seq(), {
			breakpoints = {},
		})
		Manager.send_request(set_function_breakpoints_req)
	elseif response.command == request.COMMAND.SET_DATA_BREAKPOINTS then
		--- @cast response SetDataBreakpointsResponse
	elseif response.command == request.COMMAND.SET_EXCEPTION_BREAKPOINTS then
		--- @cast response SetExceptionBreakpointsResponse
		Logger.log(response)
		local config_done_request = request.ConfigurationDone:new(Manager.get_next_seq(), {})
		Manager.send_request(config_done_request)
	elseif response.command == request.COMMAND.SET_EXPRESSION then
		--- @cast response SetExpressionResponse
	elseif response.command == request.COMMAND.SET_FUNCTION_BREAKPOINTS then
		--- @cast response SetFunctionBreakpointsResponse
		Logger.log(response)
		local set_exception_breakpoints_req = request.SetExceptionBreakpoints:new(Manager.get_next_seq(), {
			filters = { "cpp_catch", "cpp_throw" },
		})
		Manager.send_request(set_exception_breakpoints_req)
	elseif response.command == request.COMMAND.SET_INSTRUCTION_BREAKPOINTS then
		--- @cast response SetInstructionBreakpointsResponse
	elseif response.command == request.COMMAND.SET_VARIABLE then
		--- @cast response SetVariableResponse
	elseif response.command == request.COMMAND.SOURCE then
		--- @cast response SourceResponse
	elseif response.command == request.COMMAND.STACK_TRACE then
		--- @cast response StackTraceResponse
		local first_id = response.body.stackFrames[1].id
		local scopes_request = request.Scopes:new(Manager.get_next_seq(), {
			frameId = first_id,
		})
		Manager.send_request(scopes_request)
	elseif response.command == request.COMMAND.STEP_BACK then
		--- @cast response StepBackResponse
	elseif response.command == request.COMMAND.STEP_IN then
		--- @cast response StepInResponse
	elseif response.command == request.COMMAND.STEP_IN_TARGETS then
		--- @cast response StepInTargetsResponse
	elseif response.command == request.COMMAND.STEP_OUT then
		--- @cast response StepOutResponse
	elseif response.command == request.COMMAND.TERMINATE then
		--- @cast response TerminateResponse
	elseif response.command == request.COMMAND.TERMINATE_THREADS then
		--- @cast response TerminateThreadsResponse
	elseif response.command == request.COMMAND.THREADS then
		--- @cast response ThreadsResponse
	elseif response.command == request.COMMAND.VARIABLES then
		--- @cast response VariablesResponse
	elseif response.command == request.COMMAND.WRITE_MEMORY then
		--- @cast response WriteMemoryResponse
	end
end

--- @private
--- Process an event message
--- @param event Event
function Manager.process_event(event)
	if event.event == Event.EventType.INITIALIZED then
		local set_breakpoints_request = request.SetBreakpoints:new(Manager.get_next_seq(), {
			source = {
				path = "C:\\Users\\juayh\\Dev\\test\\src\\main.cpp",
			},
			breakpoints = {
				{
					line = 9,
				},
			},
		})
		Manager.send_request(set_breakpoints_request)
	elseif event.event == Event.EventType.STOPPED then
		Logger.log("Event: Stopped, Reason: " .. event.body.reason)
		if event.body.reason == StoppedEvent.Reason.ENTRY then
		elseif event.body.reason == StoppedEvent.Reason.BREAKPOINT then
			--- @cast event StoppedEvent
			-- We are stopped at one of our breakpoints, so
			-- we start collecting all the stack data for the stopped thread
			local stack_trace_request = request.StackTrace:new(Manager.get_next_seq(), {
				threadId = event.body.threadId,
			})
			Manager.send_request(stack_trace_request)
		end
	end
end

return Manager
