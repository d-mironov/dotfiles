local function safe_require(mod)
    local ok, result = pcall(require, mod)
    if not ok then
        vim.notify("Error loading module: " .. mod, vim.log.levels.ERROR)
        return nil
    end
    return result
end

local utils = safe_require("utils")

local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('<leader>w', '<cmd>w<cr>', '[W]rite buffer')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')

    local telescope = safe_require("telescope.builtin")
    nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local servers = safe_require("config.lsp-servers")
local mason = safe_require('mason')
local mason_lspconfig = safe_require("mason-lspconfig")
local lspconfig = safe_require('lspconfig')
local capabilities = safe_require("cmp_nvim_lsp").default_capabilities()

if not (mason and mason_lspconfig and lspconfig) then
    return
end

-- Setup Mason
mason.setup{}

-- Setup LSPs
mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
    handlers = {
        function(server_name)
            lspconfig[server_name].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
            }
        end,
    }
}

