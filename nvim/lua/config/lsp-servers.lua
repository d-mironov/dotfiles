local servers = {
    pyright = {
        analysis = {
            diagnosticMode = 'openFilesOnly',
        }
    },
    clangd = {},
    tsserver = {},
}
-- local servers = {
--     pyright = {
--         exec = "pyright",
--         config = {},
--     },
--     clangd = {
--         exec = "clangd",
--         config = {},
--     },
-- }

return servers
