local Manager = require("dapc.rpc.Manager")
local InitializeRequest = require("dapc.rpc.InitializeRequest")
local LaunchRequest = require("dapc.rpc.LaunchRequest")
local M = {}

function M.setup()
	M.start_process("lldb-dap")
end

local function handle_exit(code, signal)
	local message = string.format("Process exited with code: %d and signal: %d", code, signal)
	vim.print(message)
end

--- Extract the Content-Length of a JSON-RPC message
--- @param content string The target content to parse
--- @return number|nil content_length Content-Length of message, nil if there was no such header
--- @return number|nil length of the Content-Length header itself
local function get_content_length(content)
	local content_length_pattern = "Content%-Length:"
	local crlf_pattern = "\r\n"
	local content_length_start, content_length_end = string.find(content, content_length_pattern)
	if not content_length_start then
		return nil, nil
	end

	local crlf_start, _ = string.find(content, crlf_pattern)
	local content_length = string.sub(content, content_length_end + 1, crlf_start)
	return tonumber(content_length), crlf_start - content_length_start
end

--- Extract a single JSON-RPC message, stripped of the Content-Length header
--- @param content string Input content.
--- @return table|nil message The message if one was found, nil otherwise
--- @return number|nil length Length of the block, including the
--- Content-Length header
local function get_message(content)
	local content_length, length = get_content_length(content)
	if not content_length then
		return nil, nil
	end

	local crlf_start, crlf_end = string.find(content, "\r\n\r\n")
	local message = string.sub(content, crlf_end + 1, crlf_end + content_length)
	return vim.json.decode(message), content_length + length
end

--- Extract the body of a JSON-RPC message
--- @param content string The message to parse
--- @return Message[]|nil messages Found messages, nil if no messages found
--- @return number|nil length Length of all found message blocks combined,
--- including all their Content-Length headers
local function get_messages(content)
	local messages = {}
	local total_length = 0
	local message, length = get_message(content)
	while message do
		total_length = total_length + length
		table.insert(messages, message)
		content = string.sub(content, length + 1)
		message, length = get_message(content)
	end
	return messages, total_length
end

--- Handling function for incoming bytes from a stream
local buffer = ""
local function handle_read_start(err, data)
	if not data then
		return
	end

	buffer = buffer .. data
	local messages, total_length = get_messages(buffer)
	if not total_length or not messages then
		return
	end

	buffer = string.sub(buffer, total_length)

	for _, message in ipairs(messages) do
		--- i do not understand why vim.schedule is needed here.
		--- With this, there is a large reduction in the rate of failure
		--- on the part lldb-dap to issue a configurationDone request.
		--- My guess is that there is some concurrency or ordering issue that
		--- occurs in the sending and receiving of reequests, resulting in
		--- a bad or invalid request ordering. This should be investigated
		--- in the future.
		vim.schedule(function()
			Manager.ingest(message)
		end)
	end
end

function M.start_process(cmd)
	local stdin = vim.uv.new_pipe(false)
	local stdout = vim.uv.new_pipe(false)
	local stderr = vim.uv.new_pipe(false)
	local opts = {
		stdio = { stdin, stdout, stderr },
	}
	local handle, pid = vim.uv.spawn(cmd, opts, handle_exit)

	Manager.init(function(text)
		stdin:write(text)
	end)

	stdout:read_start(handle_read_start)
end

return M
