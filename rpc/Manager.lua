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
--- @param request Request Request to send
function Manager.send_request(request)
	Manager.writer(to_message(request:get_partial()))
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
	if response.command == request.COMMAND.INITIALIZE then
		vim.print("2")
		local launch_request = request.Launch:new(Manager.get_next_seq(), {
			name = "lldb-dap",
			type = "lldb-dap",
			request = "launch",
			program = "C:\\Users\\juayh\\Dev\\test\\build\\Debug\\test.exe",
			stopOnEntry = false,
		})
		Manager.send_request(launch_request)
	elseif response.command == request.COMMAND.SET_BREAKPOINTS then
		Logger.log(response)
		local set_function_breakpoints_req = request.SetFunctionBreakpoints:new(Manager.get_next_seq(), {
			breakpoints = {},
		})
		Manager.send_request(set_function_breakpoints_req)
	elseif response.command == request.COMMAND.SET_FUNCTION_BREAKPOINTS then
		Logger.log(response)
		local set_exception_breakpoints_req = request.SetExceptionBreakpoints:new(Manager.get_next_seq(), {
			filters = { "cpp_catch", "cpp_throw" },
		})
		Manager.send_request(set_exception_breakpoints_req)
	elseif response.command == request.COMMAND.SET_EXCEPTION_BREAKPOINTS then
		Logger.log(response)
		local config_done_request = request.ConfigurationDone:new(Manager.get_next_seq())
		Manager.send_request(config_done_request)
	elseif response.command == request.COMMAND.CONFIGURATION_DONE then
		Logger.log("Configuration done")
	elseif response.command == request.COMMAND.THREADS then
		-- TODO
	elseif response.command == request.COMMAND.STACK_TRACE then
		--- @cast response StackTraceResponse
		local first_id = response.body.stackFrames[1].id
		local scopes_request = request.Scopes:new(Manager.get_next_seq(), {
			frameId = first_id,
		})
		Manager.send_request(scopes_request)
	elseif response.command == request.COMMAND.SCOPES then
		Logger.log(response)
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
	elseif response.command == request.COMMAND.VARIABLES then
		Logger.log(response)
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
