call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'kien/ctrlp.vim'
Plug 'sjbach/lusty'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'ElmCast/elm-vim'
"Plug 'andys8/vim-elm-syntax'
Plug 'neomake/neomake'
Plug 'evidens/vim-twig'
Plug 'dracula/vim'
Plug 'scrooloose/nerdcommenter'
Plug 'elixir-editors/vim-elixir'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-crystal/vim-crystal'
Plug 'sainnhe/edge'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'datwaft/bubbly.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Rigellute/rigel'
Plug 'evanleck/vim-svelte'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'codechips/coc-svelte', {'do': 'npm install'}
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Add plugins to &runtimepath
call plug#end()

" == Color configuration
"set background=dark

let g:edge_style = 'aura'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

set termguicolors

" color dracula
colorscheme rigel

" == Plugins configuration
"

let g:ctrlp_follow_symlinks = 1

" Rigel bubbly theme
let g:bubbly_palette = #{
\   background: "#002635",
\   foreground: "#e6e6dc",
\   black: "#00384d",
\   red: "#c43061",
\   green: "#7fc06e",
\   yellow: "#f08e48",
\   blue: "#1c8db2",
\   purple: "#c694ff",
\   cyan: "#00cccc",
\   white: "#77929e",
\   lightgrey: "#57595e",
\   darkgrey: "#404247",
\ }

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
set tabstop=4           " Render TABs using this many spaces.
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


" Pressing ,/ will clear the search buffer
nmap <silent> ,/ :let @/=""<CR>

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

let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_open_list = 2

let g:NERDDefaultAlign = 'left'

" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

" spell languages
set spelllang=en,fr

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

" Don't display hidden chars for Go (tabs)
au FileType go set nolist

" Rust autoformating
let g:rustfmt_autosave = 1

" Remap surround by hand
" Thanks https://stackoverflow.com/questions/17537182/is-there-anyway-to-change-vim-surrounds-keymapping
let g:surround_no_mappings = 1

nmap ds  <Plug>Dsurround
nmap ls  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround

set undofile " Maintain undo history between sessions
set undodir=~/.config/nvim/undodir

" Tabular.vim
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

source ~/.vim/vimrc.bepo
