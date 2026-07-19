local breakpoint = require("dapc.ui.breakpoint")

vim.keymap.set("n", "<leader>db", breakpoint.toggle_breakpoint, {})

local M = {}

return M
