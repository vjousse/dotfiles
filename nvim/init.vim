call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'kien/ctrlp.vim'
Plug 'sjbach/lusty'
Plug 'junegunn/fzf.vim'
Plug 'ElmCast/elm-vim'
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim'
Plug 'evidens/vim-twig'
Plug 'ElmCast/elm-vim'
Plug 'dracula/vim'
Plug 'nbouscal/vim-stylish-haskell'
Plug 'alx741/vim-hindent'
Plug 'scrooloose/nerdcommenter'
Plug 'elixir-editors/vim-elixir'

" Add plugins to &runtimepath
call plug#end()

" == Color configuration
"set background=dark

color dracula

" == Plugins configuration

let g:ctrlp_follow_symlinks = 1

" == Global conf
let mapleader = ","
set hidden

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set ignorecase          " Case-insensitive searching.
set smartcase           " But case-sensitive if expression contains a capital letter.
set incsearch           " Highlight matches as you type.
set hlsearch            " Highlight matches.


set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page comma

" Copy to/from system clippboard
set clipboard+=unnamedplus

" /== End Global conf

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Press i to enter insert mode, and ii to exit.
:inoremap éé <Esc>

" Enable syntax checking
autocmd! BufWritePost * Neomake

set pastetoggle=<f2>

" Elm
let g:elm_format_autosave = 1

let g:neomake_python_enabled_makers = ['flake8']

let g:NERDDefaultAlign = 'left'

source ~/.vim/vimrc.bepo

