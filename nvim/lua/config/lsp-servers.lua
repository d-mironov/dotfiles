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
--         config = {
--             analysis = {
--                 diagnosticMode = "openFilesOnly",
--             }
--         },
--     },
--     clangd = {
--         exec = "clangd",
--         config = {},
--     },
--     zls = {
--         exec = "zls",
--         config = {},
--     },
--     rust_analyzer = {
--         exec = "rust-analyzer",
--         config = {},
--     },
--     gopls = {
--         -- go install golang.org/x/tools/gopls@latest
--         exec = "gopls",
--         config = {},
--     },
-- }

return servers
