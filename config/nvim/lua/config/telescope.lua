local telescope = require("telescope")

telescope.setup{
    defaults = {
        file_ignore_patterns = {
            -- Ignore build files for C/C++
            "%.d", "%.o", "%.slo", "%.lo", "%.obj", "%.a",
            -- Common files
            "%.pdf", "%.zip", "%.tar", "%.tar.%", "%.jpg", "%.jpeg", "%.png", "%.bmp"
        },
    },
}
