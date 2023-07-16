vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    use 'dstein64/vim-startuptime'

    -- auto-completion engine
    use "hrsh7th/nvim-cmp"
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "hrsh7th/cmp-path", after = "nvim-cmp" }
    use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
    use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
    use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }
    use {
        "SirVer/ultisnips",
        event = "InsertEnter"
    }
    use {
        "honza/vim-snippets", 
        after = "ultisnips"
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    }

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

    -- Autoformatting
    use 'sbdchd/neoformat'
    
    use 'rcarriga/nvim-notify'

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
    -- use 'numToStr/Comment.nvim'

    use 'akinsho/toggleterm.nvim'
    -- use 'windwp/nvim-autopairs'

    -- use 'normen/vim-pio'
    -- use 'ziglang/zig.vim'


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
