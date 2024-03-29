" Lusty explorer conf

" let g:LustyExplorerDefaultMappings = 0

" nmap <silent> <Leader>li :LustyFilesystemExplorer<CR>
" nmap <silent> <Leader>lu :LustyFilesystemExplorerFromHere<CR>
" nmap <silent> <Leader>la :LustyBufferExplorer<CR>

" Elm
let g:elm_format_autosave = 1

" let g:LanguageClient_serverCommands = {
"  \ 'elm': ['elm-language-server'],
"  \ }

"let g:LanguageClient_rootMarkers = {
"  \ 'elm': ['elm.json'],
"  \ }

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fé <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
" Deactivate html formatting due to problems with Jinja templates
au BufWritePre *.css,*.svelte,*.pcss,*.ts,*.js,*.json PrettierAsync
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" Fix for prettier failed to parse buffer: https://github.com/prettier/vim-prettier/issues/268
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

" FZF conf
nnoremap <silent> <leader>l :GFiles<CR>
" nnoremap <silent> <leader>dl :Rg<CR>
" nmap <silent> <Leader>lb :Buffers<CR>


" Nvim Tree
nnoremap <Leader>i :NvimTreeToggle<CR>

" Rust autoformating
let g:rustfmt_autosave = 1

let g:svelte_preprocessors = ['typescript']
