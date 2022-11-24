call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

Plug 'sjbach/lusty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
Plug 'datwaft/bubbly.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Rigellute/rigel'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'leafgarland/typescript-vim'
Plug 'brentyi/isort.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/goyo.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'lepture/vim-jinja'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lewis6991/gitsigns.nvim'
" Add plugins to &runtimepath

call plug#end()

" == Plugins configuration

" General vim settings
source ~/dotfiles/nvim/settings.vim
" Everything theme related (colors, bubbly, theme,…)
source ~/dotfiles/nvim/theme.vim
" Pure vim shortcuts
source ~/dotfiles/nvim/mappings.vim
" Plugs configuration
source ~/dotfiles/nvim/plugs.vim
" Coc.vim configuration
source ~/dotfiles/nvim/coc.vim
" All my bépo mapping
source ~/dotfiles/nvim/bepo.vim
" Lua init script (for plug requiring lua, like gitsigns, nvim-tree)
source ~/dotfiles/nvim/vimrc.lua
