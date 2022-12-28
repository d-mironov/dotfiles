vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

-- File browser
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    use {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        requires = {
            'nvim-lua/plenary.nvim',
        },
    }
    use 'akinsho/bufferline.nvim'
    
    use 'glepnir/dashboard-nvim'        -- Startup dashboard

-- Better syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() 
            pcall(require('nvim-treesitter.install').update{ with_sync = true})
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    -- Autoformatting
    use 'sbdchd/neoformat'

-- IDE features in Vim (LSP)
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
            'folke/neodev.nvim',
        },
    }
    use 'lukas-reineke/indent-blankline.nvim'
    use 'tpope/vim-surround'            -- matching braces
    use 'numToStr/Comment.nvim'

    use 'ryanoasis/vim-devicons'
    use 'akinsho/toggleterm.nvim'
    use 'windwp/nvim-autopairs'

    use 'normen/vim-pio'
    use 'ziglang/zig.vim'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'dcampos/nvim-snippy',
            'dcampos/cmp-snippy',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip'
        },
    }


--================| Themes |==================
    use 'Dave-Elec/gruvbox'
    use 'ayu-theme/ayu-vim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'sainnhe/gruvbox-material'
    use 'olimorris/onedarkpro.nvim'
    use 'ghifarit53/tokyonight-vim'
    use 'projekt0n/github-nvim-theme'
    use 'eddyekofo94/gruvbox-flat.nvim'
    use 'folke/tokyonight.nvim'
    use 'sainnhe/everforest'
    use 'Yazeed1s/minimal.nvim'
    use 'dikiaap/minimalist'
    use 'chriskempson/base16-vim'
    
end)
