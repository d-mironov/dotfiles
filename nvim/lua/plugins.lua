vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'
-- File browser
    use 'preservim/nerdtree'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
        }
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
--    use {'junegunn/fzf',  'do': { -> fzf#install() } }
--    use 'junegunn/fzf.vim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
    use 'tpope/vim-surround'            -- matching braces
    use 'dense-analysis/ale'
    
    use 'glepnir/dashboard-nvim'        -- Startup dashboard

-- Better syntax highlighting
    use 'vim-python/python-syntax'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'fladson/vim-kitty'
    use ({
        'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = function()
            require("lsp_lines").setup()
        end,
        })
    use 'sbdchd/neoformat'

-- IDE features in Vim
    use {'wfxr/minimap.vim', run = ':!cargo install --locked code-minimap'}
    use 'lukas-reineke/indent-blankline.nvim'
    use 'akinsho/bufferline.nvim'
    use 'prabirshrestha/vim-lsp'
    -- use 'mattn/vim-lsp-settings'
    -- use 'williamboman/nvim-lsp-installer'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'

    use 'ryanoasis/vim-devicons'
    use 'akinsho/toggleterm.nvim'
    use 'windwp/nvim-autopairs'
    use 'folke/which-key.nvim'
    use 'mhartington/formatter.nvim'

    use 'tpope/vim-pathogen'

    use {'fatih/vim-go', run = ':GoUpdateBinaries' }
    use 'ziglang/zig.vim'
    use 'neomake/neomake'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'dcampos/nvim-snippy',
            'dcampos/cmp-snippy',
            'hrsh7th/cmp-nvim-lsp',
            'dmitmel/cmp-vim-lsp',
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
