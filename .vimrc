" VIM Configuration - Vincent Jousse
" Some links : http://nvie.com/posts/how-i-boosted-my-vim/

set nocompatible                  " Must come first because it changes other options.

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<C

" Colorsheme
set t_Co=256
"colorscheme aldmeris255
colorscheme vitamins

" Set title on X window
set title

" Hide buffer instead of abandoning when unloading
set hidden ruler wmnu
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.
set noerrorbells         " don't beep

" Backspace behave as expected
set backspace=indent,eol,start

set backupdir=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp   " Keep swap files in one location
set directory=~/.vim/tmp/,~/.tmp,~/tmp,/var/tmp,/tmp   " Keep swap files in one location

set laststatus=2                  " Show the status line all the time

set wildmode=list:longest         " Make command completion behave like a shell

" Fast write
nmap <Leader>w :w<CR>

" Make the view port scroll faster
nnoremap <C-e> 3<C-e>             
nnoremap <C-y> 3<C-y>

" Remap the marker char
nnoremap ' `
nnoremap ` '

" Command and search pattern history
set history=1000
set undolevels=1000 

" Toggle whitespace visibility
" set listchars=tab:>-,trail:·,eol:$
" nmap <silent> <leader>z :set nolist!<CR>

" Useful status information at bottom of screen
" set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Tabs and indentation.
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis


syntax enable                     " Turn on syntax highlighting.
filetype on
filetype plugin on
filetype indent on

"highlight whitespaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
autocmd filetype html,xml set listchars-=tab:>.

"Switch vim into paste mode : will prevent ugly auto indentation
set pastetoggle=<F2>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" When I'll be a VIM master, I'll comment out those lines :)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Pressing ,/ will clear the search buffer
nmap <silent> ,/ :let @/=""<CR>

" Use w!! when you've forgotten to open your file as root
cmap w!! w !sudo tee % >/dev/null


" Allow extended digraphs
set encoding=utf-8


" Enable folding by indentation
" Use: zc, zo, zC, zO, zR, zM
" Ctrl-K .3 for ⋯
" set foldmethod=indent
highlight Folded ctermfg=red
highlight FoldColumn ctermfg=white
set fillchars=fold:⋯

" My information
iab xdate =strftime("%d/%m/%Y %H:%M:%S")
iab xname Vincent Jousse 
iab xsigp Vincent Jousse
iab xsigw Vincent Jousse

" Strip trailing whitespace in whole file
func! StripTrailingWS()
%s/\s\+$//
endfunc
command! StripTrailingWS call StripTrailingWS()

" PHP
let php_htmlInStrings = 1 "Coloration des balises HTML

" Indent PHP templates as HTML files
nnoremap <leader>= :set ft=html<cr>mhgg=G'h:set ft=php<cr>
map <leader>= :set ft=html<cr>mhgg=G'h:set ft=php<cr>
" Indent whole PHP file
nnoremap <leader>i <Esc>mygg=G'y
map <leader>i <Esc>mygg=G'y

" phpdoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
let g:pdv_cfg_Author = "Vincent Jousse <vincent.jousse@devorigin.fr>"
let g:pdv_cfg_Copyright = "2010 Devorigin"
let g:pdv_cfg_License = "LGPL 3.0 {@link http://www.opensource.org/licenses/lgpl-3.0.html}"

let mapleader = ","

" Symfony plugin
let g:symfony_fuf = 1

" TagList
let Tlist_Show_One_File = 1
nnoremap <silent> <F7> :TlistToggle<CR>

" Nerd Tree
map <Leader>nf :NERDTree<Enter>
map <Leader>nr :NERDTree %:p:h<Enter>
let NERDTreeQuitOnOpen=1

" Syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_warnings=0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Snipmate
let g:snips_author = 'Thibault Duplessis <thibault.duplessis@gmail.com>'

" Encoding
set statusline+=%<%f\ [%{GitBranch()}]\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P


" CTAGS
map <C-h> <C-T>
map <C-l> <C-]>
map <C-m> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>


" CTAGS
" Explore tags for the word under the cursor
map <C-l> <C-]>
" Back to previous location after browsing tags
map <C-h> <C-T>
" Jump to next tag match
map ]t :tnext<CR>
" Jump to previous tag match
map [t :tprevious<CR>
" Open tag command
map <C-T> :tag 
let g:Tlist_Ctags_Cmd = 'ctags'
" Rebuild tag index
nnoremap <silent> <C-F7> :silent !ctags -h ".php" --PHP-kinds=+cf --recurse --exclude=*/cache/* --exclude=*/logs/* --exclude=*/data/* --exclude="\.git" --exclude="\.svn" --languages=PHP &<cr>


"jquery color
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Symfony
map <leader>sa :Saction <CR>
map <leader>sv :Sview <CR>

"Latex

let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_MultipleCompileFormats = 'dvi,ps,pdf'
let g:Tex_DefaultTargetFormat = 'pdf'


"Spell
augroup filetypedetect
  au BufNewFile,BufRead *.tex setlocal spell spelllang=fr
augroup END

"toggle spell
function! ToggleSpell()
  if &spell
    set nospell
  else
    set spell
  end
endfunction

noremap <F10> :call ToggleSpell()<cr>
inoremap <F10> <Esc>:call ToggleSpell()<cr>a
