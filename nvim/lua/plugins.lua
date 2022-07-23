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
    use 'nvim-telescope/telescope.nvim'
    
    -- Telescope fuzzy finder
    use {
        {
          'nvim-telescope/telescope.nvim',
          requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'telescope-frecency.nvim',
            'telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
          },
          wants = { 'popup.nvim',
            'plenary.nvim',
            'telescope-frecency.nvim',
            'telescope-fzf-native.nvim',
          },
          setup = [[require('config.telescope_setup')]],
          config = [[require('config.telescope')]],
          cmd = 'Telescope',
          module = 'telescope',
        },
        {
          'nvim-telescope/telescope-frecency.nvim',
          after = 'telescope.nvim',
          requires = 'tami5/sqlite.lua',
        },
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          run = 'make',
        },
      }

    use 'glepnir/dashboard-nvim'

-- Better syntax highlighting
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'vim-python/python-syntax'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'fladson/vim-kitty'

-- IDE features in Vim
    -- use {'neoclide/coc.nvim', branch = 'release'}
    use {'wfxr/minimap.vim', run = ':!cargo install --locked code-minimap'}
    use 'lukas-reineke/indent-blankline.nvim'
    use 'akinsho/bufferline.nvim'
    use 'prabirshrestha/vim-lsp'
    use 'mattn/vim-lsp-settings'
    use {'sakhnik/nvim-gdb', run = ':!./install.sh'}
    use 'nikvdp/neomux'
    use 'ryanoasis/vim-devicons'
    use 'akinsho/toggleterm.nvim'
    use 'neovim/nvim-lspconfig'
    use 'windwp/nvim-autopairs'
    use 'folke/which-key.nvim'
    -- use 'prabirshrestha/asyncomplete.vim'
    -- use 'prabirshrestha/asyncomplete-lsp.vim'
    -- use 'keremc/asyncomplete-clang.vim'
    use 'mhartington/formatter.nvim'

    use 'tpope/vim-pathogen'

    use {'fatih/vim-go', run = ':GoUpdateBinaries' }
    use 'ziglang/zig.vim'
    use 'neomake/neomake'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            --'hrsh7th/cmp-vim-lsp',
            'dmitmel/cmp-vim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip'
        },
    }

-----------------> Unused <------------------
--     use 'sudar/vim-arduino-syntax'
--     use 'corpix/cello.vim'
--     use 'prabirshrestha/asyncomplete.vim'
--     use 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemote    useins'}
--     use 'sheerun/vim-polyglot'
--     use 'vim-syntastic/syntastic'
--     use 'justinmk/vim-syntax-extra'
--     use 'octol/vim-cpp-enhanced-highlight'
--     use 'bfrg/vim-cpp-modern'
--     use 'vim-jp/vim-cpp'
--     use 'mhinz/vim-startify'
--     use 'glepnir/lspsaga.nvim'   TODO: Look into
--     use 'Shougo/deoplete.nvim'
--     use 'lighttiger2505/deoplete-vim-lsp'

--================| Themes |==================
--    use 'morhetz/gruvbox'
    use 'Dave-Elec/gruvbox'
    use 'srcery-colors/srcery-vim'
    use 'ayu-theme/ayu-vim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'fxn/vim-monochrome'
    use 'Lokaltog/vim-monotone'
    use 'sainnhe/gruvbox-material'
    use 'Dave-Elec/gruvbox'
    use 'joshdick/onedark.vim'
    use 'olimorris/onedarkpro.nvim'
    use 'rakr/vim-one'
    use 'ghifarit53/tokyonight-vim'
    use 'eddyekofo94/gruvbox-flat.nvim'
--     use 'folke/tokyonight.nvim', { 'branch': 'main' }
    use 'logico/typewriter-vim'
    use 'sainnhe/everforest'
    use 'rebelot/kanagawa.nvim'
    use 'hzchirs/vim-material'
    use 'sainnhe/sonokai'
    use 'arzg/vim-colors-xcode'
    use 'sainnhe/edge'
    use 'mangeshrex/everblush.vim'
    use '~/gruvboxpro.nvim'
    
end)
