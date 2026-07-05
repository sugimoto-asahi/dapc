local util = require("dapc.ui.util")
local breakpoint = require("dapc.ui.breakpoint")

local highlights_ns = vim.api.nvim_create_namespace("DapcHighlights")
vim.api.nvim_set_hl(highlights_ns, "DapcBreakpointSign", { link = "DiagnosticError" })
vim.api.nvim_set_hl(highlights_ns, "DapcBreakpointLine", {})
vim.api.nvim_set_hl(highlights_ns, "DapcCurrentLine", {
	bg = util.get_hl_color("TabLineSel", "bg"),
})

--- Register all highlights
vim.api.nvim_set_hl_ns(highlights_ns)
vim.keymap.set("n", "<leader>db", breakpoint.toggle_breakpoint, {})
