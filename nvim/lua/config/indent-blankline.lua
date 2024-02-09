-- Exclude the dashboard from showing the blanklines
require("ibl").setup{
    exclude = {
        filetypes = {"dashboard"},
    },
}
