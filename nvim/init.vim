call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

Plug 'sjbach/lusty'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
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

" == Color configuration
"set background=dark

set termguicolors

" color dracula
colorscheme rigel

" == Plugins configuration
"

lua <<EOF
require('gitsigns').setup()
require'nvim-tree'.setup {
  view = {
    side = "right",
    mappings = {
      custom_only = true,
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
        { key = "<C-e>",                        action = "edit_in_place" },
        { key = {"O"},                          action = "edit_no_picker" },
        { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
        { key = "<C-v>",                        action = "vsplit" },
        { key = "<C-x>",                        action = "split" },
        { key = "<C-t>",                        action = "tabnew" },
        { key = "<",                            action = "prev_sibling" },
        { key = ">",                            action = "next_sibling" },
        { key = "P",                            action = "parent_node" },
        { key = "<BS>",                         action = "close_node" },
        { key = "<Tab>",                        action = "preview" },
        { key = "K",                            action = "first_sibling" },
        { key = "J",                            action = "last_sibling" },
        { key = "I",                            action = "toggle_git_ignored" },
        { key = "H",                            action = "toggle_dotfiles" },
        { key = "R",                            action = "refresh" },
        { key = "a",                            action = "create" },
        { key = "d",                            action = "remove" },
        { key = "D",                            action = "trash" },
        { key = "r",                            action = "rename" },
        { key = "<C-r>",                        action = "full_rename" },
        { key = "x",                            action = "cut" },
        { key = "c",                            action = "copy" },
        { key = "p",                            action = "paste" },
        { key = "y",                            action = "copy_name" },
        { key = "Y",                            action = "copy_path" },
        { key = "gy",                           action = "copy_absolute_path" },
        { key = "[c",                           action = "prev_git_item" },
        { key = "]c",                           action = "next_git_item" },
        { key = "-",                            action = "dir_up" },
        { key = "e",                            action = "system_open" },
        { key = "f",                            action = "live_filter" },
        { key = "F",                            action = "clear_live_filter" },
        { key = "q",                            action = "close" },
        { key = "g?",                           action = "toggle_help" },
        { key = "W",                            action = "collapse_all" },
        { key = "S",                            action = "search_node" },
        { key = "<C-k>",                        action = "toggle_file_info" },
        { key = ".",                            action = "run_file_command" }
      },
    },
  },
}
EOF

nnoremap <C-t> :m .+1<CR>==
nnoremap <C-s> :m .-2<CR>==
inoremap <C-t> <Esc>:m .+1<CR>==gi
inoremap <C-s> <Esc>:m .-2<CR>==gi
vnoremap <C-t> :m '>+1<CR>gv=gv
vnoremap <C-s> :m '<-2<CR>gv=gv

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
let mapleader = " "
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


" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

set signcolumn=auto


" /== End Global conf


nnoremap <Leader>i :NvimTreeToggle<CR>

" Pressing ,/ will clear the search buffer
nmap <silent> ,/ :let @/=""<CR>

" Lusty explorer conf

let g:LustyExplorerDefaultMappings = 0

nmap <silent> <Leader>lf :LustyFilesystemExplorer<CR>
nmap <silent> <Leader>lr :LustyFilesystemExplorerFromHere<CR>
nmap <silent> <Leader>lb :LustyBufferExplorer<CR>

" FZF conf
nnoremap <silent> <leader>l :GFiles<CR>
" nnoremap <silent> <leader>dl :Rg<CR>
" nmap <silent> <Leader>lb :Buffers<CR>

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Press i to enter insert mode, and ii to exit.
" :inoremap éé <Esc>
:inoremap ii <Esc>

" Enable syntax checking
" autocmd! BufWritePost * Neomake

set pastetoggle=<f2>

" Elm
let g:elm_format_autosave = 1


let g:LanguageClient_serverCommands = {
  \ 'elm': ['elm-language-server'],
  \ }

let g:LanguageClient_rootMarkers = {
  \ 'elm': ['elm.json'],
  \ }

" let g:neomake_python_enabled_makers = ['flake8']
" let g:neomake_open_list = 2
" let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501'], }

let g:NERDDefaultAlign = 'left'

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
" Deactivate html formatting due to problems with Jinja templates
au BufWritePre *.css,*.svelte,*.pcss,*.ts,*.js,*.json PrettierAsync

" Fix for prettier failed to parse buffer: https://github.com/prettier/vim-prettier/issues/268
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

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

let g:svelte_preprocessors = ['typescript']

source ~/.vim/vimrc.coc
source ~/.vim/vimrc.bepo
