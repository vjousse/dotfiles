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
