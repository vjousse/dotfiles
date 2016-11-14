call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/LustyExplorer'

" Add plugins to &runtimepath
call plug#end()

" == Plugins configuration

let g:ctrlp_follow_symlinks = 1

" == End Plugins configuration

" == Global conf
let mapleader = ","
:set hidden

" /== End Global conf

" Press i to enter insert mode, and ii to exit.
:inoremap éé <Esc>

set pastetoggle=<f2>
source ~/.vim/vimrc.bepo
