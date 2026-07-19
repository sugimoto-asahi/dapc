local Breakpoints = require("dapc.Breakpoints")

vim.keymap.set("n", "<leader>db", function()
	Breakpoints:toggle_breakpoint()
end, {})

local M = {}

return M
