------------------------------------------->LSP Server Setup<-------------------------------------------------
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--[[
-- Install an LSP Server with :LspInstall while you are in a file
-- Then add the LSP here
--]]
require('lspconfig')['ccls'].setup {
    capabilities = capabilities
}
require('lspconfig')['jedi_language_server'].setup {
    capabilities = capabilities
}
require('lspconfig')['zls'].setup {
    capabilities = capabilities
}
require('lspconfig')['julials'].setup {
    capabilities = capabilities
}
require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
}
require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}
require('lspconfig')['html'].setup {
    capabilities = capabilities
}
require('lspconfig')['angularls'].setup {
    capabilities = capabilities
}
require('lspconfig')['marksman'].setup {
    capabilities = capabilities
}
--------------------------------------------------------------------------------------------------------------
