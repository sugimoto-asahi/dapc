local Threads = require("dapc.rpc.request.Threads")
local Continue = require("dapc.rpc.request.Continue")
local Initialize = require("dapc.rpc.request.Initialize")
local Launch = require("dapc.rpc.request.Launch")
local ConfigurationDone = require("dapc.rpc.request.ConfigurationDone")
local Scopes = require("dapc.rpc.request.Scopes")
local SetBreakpoints = require("dapc.rpc.request.SetBreakpoints")
local SetExceptionBreakpoints = require("dapc.rpc.request.SetExceptionBreakpoints")
local SetFunctionBreakpoints = require("dapc.rpc.request.SetFunctionBreakpoints")
local StackTrace = require("dapc.rpc.request.StackTrace")
local Variables = require("dapc.rpc.request.Variables")
local COMMAND = require("dapc.rpc.request.Request").COMMAND

local M = {
	Threads = Threads,
	Continue = Continue,
	Initialize = Initialize,
	Launch = Launch,
	ConfigurationDone = ConfigurationDone,
	Scopes = Scopes,
	SetBreakpoints = SetBreakpoints,
	SetExceptionBreakpoints = SetExceptionBreakpoints,
	SetFunctionBreakpoints = SetFunctionBreakpoints,
	StackTrace = StackTrace,
	Variables = Variables,
	COMMAND = COMMAND,
}

return M
