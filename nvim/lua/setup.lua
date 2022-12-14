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

-- Wether you want Autoformat on save or not (does not work lol)
format_autosafe = false

-- Gruvbox material setup
g.gruvbox_material_diagnostic_virtual_text = "colored"
vim.cmd [[
    function! s:gruvbox_material_custom() abort
        " Link a highlight group to a predefined highlight group.
        " See `colors/gruvbox-material.vim` for all predefined highlight groups.
        highlight! link TSPunctBracket Red
        highlight! link TSProperty Red
        highlight! link TSConstant Yellow 
    endfunction
    
    augroup GruvboxMaterialCustom
        autocmd!
        autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
    augroup END
]]


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

if format_autosafe == true then
    vim.cmd [[
    augroup fmt
      autocmd!
      au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
    augroup END
    ]]
end

-- syntastic config
-- g.syntastic_cpp_checkers = {'cpplint'}
-- g.syntastic_c_checkers = {'cpplint'}
-- g.syntastic_cpp_cpplint_exec = 'cpplint'

local ok, bl = pcall(require, "bufferline")
if ok then
    bl.setup{
        options = {
            indicator = {
                style = 'none',
            },
            show_buffer_icons = false,
            show_buffer_close_icons = false,
            show_close_icon = false,
            show_buffer_default_icon = false,
            tab_size = 10,
            max_name_length = 10,
        }
    }
end

local ok, nvimautopairs = pcall(require, "nvim-autopairs")
if ok then
    nvimautopairs.setup{}
end

local ok, whichkey = pcall(require, "which-key")
if ok then
    whichkey.setup {}
end

local ok, nvimtree = pcall(require, "nvim-tree")
if ok then
    nvimtree.setup()
end

local ok, toggleterm = pcall(require, "toggleterm")
if ok then
    toggleterm.setup{
        size = 20,
    }
end

local ok, mason = pcall(require, "mason")
if ok then
    mason.setup()
end

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if ok then
    mason_lspconfig.setup({
        ensure_installed = {
            "clangd",
            "jedi_language_server",
            "zls",
            "julials",
            "rust_analyzer",
            "gopls",
            "html",
            "marksman",
            "bashls",
            "jdtls",
            "tsserver"
        },
        automatic_installation = true,
    })
end


local ok, db = pcall(require, "dashboard")
if ok then
    db.custom_header = {
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
end

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if ok then
    treesitter.setup {
      ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      ignore_install = {}, -- List of parsers to ignore installing
      highlight = {
        enable = true,              -- false will disable the whole extension
        disable = {},  -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
      },
    }
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local ok, cmp = pcall(require, "cmp")
if ok then
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
            { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            { name = 'path'},
            { name = 'buffer' },
        })
    })
end


-- vim.diagnostic.config({
--   virtual_text = false,
--   virtual_lines = true,
-- })
