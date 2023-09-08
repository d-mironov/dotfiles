local g = vim.g
local ib = require("indent_blankline")

-- Exclude the dashboard from showing the blanklines
g.indent_blankline_bufname_exclude = {"dashboard"},
ib.setup()
