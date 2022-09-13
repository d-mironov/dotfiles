local o = vim.opt
local g = vim.g

o.termguicolors     = true
o.number            = true          -- Enable line numbers
o.expandtab         = true
o.ruler             = true
o.relativenumber    = true          -- Enable relative line numbers
o.hidden            = true
o.clipboard         = "unnamedplus" -- Enable yanking to system clipboard 
o.shiftwidth        = 4
o.tabstop           = 4             -- <Tab> size
o.cmdheight         = 2

-- Discord Presence config
g.presence_enable_line_number = 1
g.presence_auto_update = 1
g.presence_neovim_image_text = "NeoVim"
-- C/C++ Better Syntax config
g.cpp_class_scope_highlight = 1
g.cpp_member_variable_highlighting = 1
g.cpp_class_decl_highlighting = 1
g.cpp_posix_standard = 1
g.cpp_experimental_simple_template_highlight = 1
g.cpp_experimental_template_highlight = 1
g.cpp_concepts_highlight = 1

-- NeoFormat config
g.neoformat_c_clangformat = {
    exe = "clang-format",
    args = {'--style=file:$HOME/.config/nvim/lua/.clang-format'}
}
g.neoformat_cpp_clangformat = {
    exe = "clang-format",
    args = {'--style=file:$HOME/.config/nvim/lua/.clang-format'}
}
g.neoformat_enabled_c = {'clangformat'}
g.neoformat_enabled_cpp = {'clangformat'}
vim.cmd [[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]]

-- syntastic config
g.syntastic_cpp_checkers = {'cpplint'}
g.syntastic_c_checkers = {'cpplint'}
g.syntastic_cpp_cpplint_exec = 'cpplint'

require('bufferline').setup {}
require('nvim-autopairs').setup{}
require("which-key").setup {}
require("nvim-tree").setup()
require("toggleterm").setup{
    size = 20,
}
require("nvim-lsp-installer").setup{}
require("github-theme").setup({
  comment_style = "italic",
  keyword_style = "bold",
  function_style = "NONE",
  variable_style = "NONE"
})


local db = require("dashboard") db.custom_header = {
    "",
    "",
    "",
    "",
    "      ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
    "       ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
    "             ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
    "              ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
    "             ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
    "      ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
    "     ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
    "    ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
    "    ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
    "         ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
    "          ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
    "",
--    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
--    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
--    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
--    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
--    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
--    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    ""}

db.custom_center = {
    -- {icon = '  ',
    -- desc = 'Recently latest session                  ',
    -- shortcut = 'SPC s l',
    -- action ='SessionLoad'},
    {icon = '  ',
    desc = 'Find  File',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = ''},
    {icon = '  ',
    desc = 'Recently opened files',
    action =  'DashboardFindHistory',
    shortcut = ''},
    {icon = '  ',
    desc ='File Browser',
    action =  'NERDTreeToggle',
    shortcut = ''},
    {icon = '  ',
    desc = 'Find word',
    action = 'Telescope live_grep',
    shortcut = ''},
    {icon = '  ',
    desc = 'Quit NeoVim',
    action = 'q',
    shortcut = ''},
}

require ('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'path'},
    }, 
    {
        { name = 'buffer' },
    })
})
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

------------------------------------------->LSP Server Setup<-------------------------------------------------
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
require('lspconfig')['grammarly'].setup {
    capabilities = capabilities
}
require('lspconfig')['marksman'].setup {
    capabilities = capabilities
}
--------------------------------------------------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = true,
})
