--- @class LaunchConfig JSON specification of a launch config
--- @field adapter string Absolute path to debug adapter. Can also be the binary name itself,
--- provided the binary exists on the PATH.
--- @field program string Absolute path to binary to debug
--- @field args string[] Arguments to binary

--- @class LaunchConfigManager finding and loading launch configurations, and providing
--- information about launch configurations to the rest of dapc.
--- @field private MATCH string filename to recognize as a launch configuration file
--- @field private config LaunchConfig|nil Deserialized configuration file, nil if there is no valid
--- configuration file
local LaunchConfigManager = {
	MATCH = "launch.json",
	config = nil,
}

--- Update (or find) a launch configuration file, which is a launch.json file at
--- the project root. All parent directories from the directory this nvim session
--- was launched are searched.
--- @return boolean success
function LaunchConfigManager:update()
	local found_dir = vim.fs.root(0, self.MATCH)
	if found_dir then
		local config_path = found_dir .. "/" .. self.MATCH
		return self:parse(config_path)
	else
		vim.notify("A launch configuration file was not found, so dapc cannot be used.", vim.log.levels.WARN)
		return false
	end
end

--- @private
--- Parse a configuration file
--- @param config_path string Absolute path to config
--- @return boolean success
function LaunchConfigManager:parse(config_path)
	local file = io.open(config_path, "r")
	if not file then
		vim.notify("Invalid config path", vim.log.levels.ERROR)
		return false
	end
	local content = file:read("*a")
	file:close()

	local success, result = pcall(function()
		return vim.json.decode(content)
	end)
	if not success then
		vim.notify("Config is not a valid json")
		return false
	else
		-- verify contents
		local valid = true
		if not result["adapter"] then
			valid = false
		elseif not result["program"] then
			valid = false
		elseif not result["args"] then
			valid = false
		end
		if valid then
			self.config = result
		end
		return valid
	end
end

--- Get the parsed configuration table
--- @return LaunchConfig|nil config
--- @return string? message
function LaunchConfigManager:get()
	if not LaunchConfigManager:update() then
		return nil, "Failed to load configuration file"
	else
		return self.config
	end
end

return LaunchConfigManager
