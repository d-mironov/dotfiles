local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        event = {"BufRead", "BufNewFile"},
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("config.lsp")
        end
    },
    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- Builtin Neovim LSP
            "hrsh7th/cmp-path",         -- Path completion
            "hrsh7th/cmp-buffer",       -- Buffer completion
            "hrsh7th/cmp-omni",
            {
                "quangnguyen30192/cmp-nvim-ultisnips",
                config = function()
                    require("cmp_nvim_ultisnips").setup{}
                end
            }
        },
        config = function()
            require("config.nvim-cmp")
        end,
    },

    -- Snippet engine
    {
	    "SirVer/ultisnips",
	    event = "InsertEnter",
	    dependencies = {
	        "honza/vim-snippets",
    	},
    },

    -- Better Syntax Highlighting
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        event = "VeryLazy",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true})()
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("config.treesitter")
        end,
    },

    -- Fuzzy Finder
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-lua/plenary.nvim",
        },
    },
    -- Terminal popup
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
        config = function()
            require("toggleterm").setup({
                size = 20,
            })
        end,
    },

    -- Github Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup()
        end
    },

    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        event = "VeryLazy",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup()
        end,
    },

    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("config.dashboard")
        end
    },

    "tpope/vim-surround",
    "akinsho/bufferline.nvim",
    "sbdchd/neoformat",
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("config.indent-blankline")
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy = false,
    },
    {
        'andweeb/presence.nvim',
        config = function()
            require('presence').setup({
                enable_line_number = true,

                line_number_text = "Line %s:%s",
                workspace_text = "Workspace: %s",

            })
        end,
    },

    -- Obsidian
    {
        'epwalsh/obsidian.nvim',
        version = '*',
        lazy = true,
        ft = 'markdown',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            workspaces = {
                {
                    name = 'Notes',
                    path = '~/Notes/obsidian',
                },
            }
        },
    },



    -- Colorschemes
    'Dave-Elec/gruvbox',
    'ayu-theme/ayu-vim',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'sainnhe/gruvbox-material',
    'olimorris/onedarkpro.nvim',
    'ghifarit53/tokyonight-vim',
    'eddyekofo94/gruvbox-flat.nvim',
    'folke/tokyonight.nvim',
    'sainnhe/everforest',
})
