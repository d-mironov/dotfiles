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
o.mouse             = ""
o.conceallevel      = 2


g.mapleader = ' '
g.maplocalleader = ' '
g.codeium_tab_fallback="<Tab>"

