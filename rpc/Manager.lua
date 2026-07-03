local InitializeRequest = require("dapc.rpc.InitializeRequest")
local ContinueRequest = require("dapc.rpc.ContinueRequest")
local StackTraceRequest = require("dapc.rpc.StackTraceRequest")
local ThreadsRequest = require("dapc.rpc.ThreadsRequest")
local SetBreakpointsRequest = require("dapc.rpc.SetBreakpointsRequest")
local SetFunctionBreakpointsRequest = require("dapc.rpc.SetFunctionBreakpointsRequest")
local SetExceptionBreakpointsRequest = require("dapc.rpc.SetExceptionBreakpointsRequest")
local ConfigurationDoneRequest = require("dapc.rpc.ConfigurationDoneRequest")
local LaunchRequest = require("dapc.rpc.LaunchRequest")
local Request = require("dapc.rpc.Request")
local Event = require("dapc.rpc.Event")
local Message = require("dapc.rpc.Message")
local StoppedEvent = require("dapc.rpc.StoppedEvent")

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
	local init_request = InitializeRequest:new(Manager.get_next_seq(), { adapterID = "lldb-dap" })
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
	if response.command == Request.RequestCommand.INITIALIZE then
		local launch_request = LaunchRequest:new(Manager.get_next_seq(), {
			name = "lldb-dap",
			type = "lldb-dap",
			request = "launch",
			program = "C:\\Users\\juayh\\Dev\\test\\build\\Debug\\test.exe",
			stopOnEntry = false,
		})
		Manager.send_request(launch_request)
	elseif response.command == Request.RequestCommand.SET_BREAKPOINTS then
		local set_function_breakpoints_req = SetFunctionBreakpointsRequest:new(Manager.get_next_seq(), {
			breakpoints = { { name = "add" } },
		})
		Manager.send_request(set_function_breakpoints_req)
	elseif response.command == Request.RequestCommand.SET_FUNCTION_BREAKPOINTS then
		local set_exception_breakpoints_req = SetExceptionBreakpointsRequest:new(Manager.get_next_seq(), {
			filters = { "cpp_throw", "cpp_catch" },
		})
		Manager.send_request(set_exception_breakpoints_req)
	elseif response.command == Request.RequestCommand.SET_EXCEPTION_BREAKPOINTS then
		local config_done_request = ConfigurationDoneRequest:new(Manager.get_next_seq())
		Manager.send_request(config_done_request)
	elseif response.command == Request.RequestCommand.CONFIGURATION_DONE then
		vim.print("Configuration done")
	elseif response.command == Request.RequestCommand.THREADS then
		-- local id = response.body.threads[4].id
		-- local stack_trace_request = StackTraceRequest:new(Manager.get_next_seq(), {
		-- 	threadId = id,
		-- })
		-- Manager.send_request(stack_trace_request)
	elseif response.command == Request.RequestCommand.STACK_TRACE then
		vim.print(response)
	end
end

--- @private
--- Process an event message
--- @param event Event
function Manager.process_event(event)
	if event.event == Event.EventType.INITIALIZED then
		local set_breakpoints_request = SetBreakpointsRequest:new(Manager.get_next_seq(), {
			source = {
				path = "C:\\Users\\juayh\\Dev\\test\\src\\main.cpp",
			},
			breakpoints = {
				{
					line = 8,
				},
			},
		})
		Manager.send_request(set_breakpoints_request)
	elseif event.event == Event.EventType.STOPPED then
		if event.body.reason == StoppedEvent.Reason.ENTRY then
			vim.print("stopped event: entry")
		end
		-- local threads_request = ThreadsRequest:new(Manager.get_next_seq())
		-- Manager.send_request(threads_request)
	end
end

return Manager
