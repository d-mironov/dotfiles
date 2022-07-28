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
    use 'tpope/vim-surround'
    use 'dense-analysis/ale'
    
    -- Telescope fuzzy finder
use 'glepnir/dashboard-nvim'

-- Better syntax highlighting
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
    use 'vim-python/python-syntax'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'fladson/vim-kitty'
    use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'
    use 'sbdchd/neoformat'

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
    use 'joshdick/onedark.vim'
    use 'olimorris/onedarkpro.nvim'
    use 'rakr/vim-one'
    use 'ghifarit53/tokyonight-vim'
    use 'projekt0n/github-nvim-theme'
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
    use 'Yazeed1s/minimal.nvim'
    use 'dikiaap/minimalist'
    use 'ackyshake/Spacegray.vim'
    use 'chriskempson/base16-vim'
    
end)
