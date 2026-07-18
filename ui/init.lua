local breakpoint = require("dapc.ui.breakpoint")

-- highlights setup
local highlights_ns = vim.api.nvim_create_namespace("DapcHighlights")
vim.api.nvim_set_hl(highlights_ns, "DapcBreakpointSign", { link = "DiagnosticError" })
vim.api.nvim_set_hl(highlights_ns, "DapcBreakpointLine", {})

--- Register all highlights
vim.api.nvim_set_hl_ns(highlights_ns)
vim.keymap.set("n", "<leader>db", breakpoint.toggle_breakpoint, {})

local M = {}

return M
