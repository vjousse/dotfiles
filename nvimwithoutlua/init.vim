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
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
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
"source ~/dotfiles/nvim/bepo.vim

" Try to keep max compatiblity with default AZERTY layout
set langmap=ba,éz,pe,or,èt,çy,vu,di,lo,jp,w$,z^,aq,us,id,ef,\\,g,ch,tj,sk,rl,nm,mù,^*,ê<,àw,yx,xc,.v,kb,'n,q\\,,g\\;,h:,f!,BA,ÉZ,PE,OR,ÈT,ÇY,VU,DI,LO,FP,JP,Z£,AQ,US,ID,EF,?G,CH,TJ,SK,RL,NM,M%,!*,Ê>,ÀW,YX,XC,:V,KB,\\;G,QG,G.,H/,F§,@œ,_&,"é,«",»',((,)-,+è,-_,*ç,/à,=),%=,$Œ,^°,µ+,#“,{´,}~,<#,>{,\[\[,\]|,±`,¬\,×^,÷@,¯\],%}ba,éz,pe,or,èt,çy,vu,di,lo,jp,z^,aq,us,id,ef,\\,g,ch,tj,sk,rl,nm,mù,^*,ê<,yx,xc,.v,kb,'n,q\\,,g\\;,h:,f!,BA,ÉZ,PE,OR,ÈT,ÇY,VU,DI,LO,FP,JP,Z£,AQ,US,ID,EF,?G,CH,TJ,SK,RL,NM,M%,!*,Ê>,ÀW,YX,XC,:V,KB,\\;N,QG,G.,H/,F§,@œ,_&,"é,«",»',((,)-,+è,-_,*ç,/à,=),%=,$Œ,^°,µ+,#“,{´,}~,<#,>{,\[\[,\]|,±`,¬\,×^,÷@,¯\],%}

" Lua init script (for plug requiring lua, like gitsigns, nvim-tree)
source ~/dotfiles/nvim/vimrc.lua
