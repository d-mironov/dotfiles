------------------------------------------->LSP Server Setup<-------------------------------------------------
local ok, cmp = pcall(require, "cmp_nvim_lsp")
local capabilities = nil
if ok then
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
end
--[[
-- Install an LSP Server with :LspInstall while you are in a file
-- Then add the LSP here
--]]
local ok, lspconfig = pcall(require, "lspconfig")
if ok and capabilities ~= nil then
    lspconfig['clangd'].setup {
        capabilities = capabilities
    }
    lspconfig['jedi_language_server'].setup {
        capabilities = capabilities
    }
    lspconfig['zls'].setup {
        capabilities = capabilities
    }
    lspconfig['julials'].setup {
        capabilities = capabilities
    }
    lspconfig['rust_analyzer'].setup {
        capabilities = capabilities
    }
    lspconfig['gopls'].setup {
        capabilities = capabilities
    }
    lspconfig['html'].setup {
        capabilities = capabilities
    }
    lspconfig['marksman'].setup {
        capabilities = capabilities
    }
    lspconfig['bashls'].setup {
        capabilities = capabilities
    }
    lspconfig['jdtls'].setup {
        capabilities = capabilities
    }
    lspconfig['tsserver'].setup {
        capabilities = capabilities
    }
end
