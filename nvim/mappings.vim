" Move lines around
nnoremap <C-t> :m .+1<CR>==
nnoremap <C-s> :m .-2<CR>==
inoremap <C-t> <Esc>:m .+1<CR>==gi
inoremap <C-s> <Esc>:m .-2<CR>==gi
vnoremap <C-t> :m '>+1<CR>gv=gv
vnoremap <C-s> :m '<-2<CR>gv=gv

" Pressing ,/ will clear the search buffer
nmap <silent> ,/ :let @/=""<CR>

" Press i to enter insert mode, and ii to exit.
" :inoremap éé <Esc>
:inoremap ii <Esc>

nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
