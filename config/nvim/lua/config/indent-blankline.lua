local hooks = require "ibl.hooks"
hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

-- Exclude the dashboard from showing the blanklines
require("ibl").setup{
    exclude = {
        filetypes = {"dashboard"},
    },
}
