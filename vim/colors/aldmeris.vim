" Vim color scheme
" A port of the gedit oblivion theme for vim
" Original author: Paolo Borelli <pborelli@gnome.org>
"
" Name:         aldmeris.vim
" Maintainer:   Vincent Velociter
" Contributor:  Thibault Duplessis
" License:      Public license
" Version:      0.1

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "aldmeris"

"GUI Colors
hi Normal       guibg=#1d1f1f guifg=#d3d7cf
hi Cursor       guibg=#d3d7cf guifg=#000000
hi CursorLine   guibg=#000000 guifg=NONE
hi CursorColumn guibg=#000000 guifg=NONE
hi MatchParen   guibg=#ad7fa8 guifg=#FFFFFF
hi Visual       guibg=#50506A guifg=#eeeeec
hi LineNr       guibg=#000000 guifg=#555753
hi Folded       guibg=NONE    guifg=#c3c7ca

" Invisible characters
hi NonText      guibg=NONE    guifg=#555753
hi SpecialKey   guibg=NONE    guifg=#555753

" Pmenu
hi Pmenu        guibg=#000000 guifg=#c0c0c0
hi PmenuSel     guibg=#555753 guifg=#ffffff
hi PmenuSbar    guibg=#444444 guifg=#444444
hi PmenuThumb   guibg=#888888 guifg=#888888 

"General Colors
hi Comment      guibg=NONE    guifg=#888a85 gui=italic
hi Constant     guibg=NONE    guifg=#fce94f
hi String       guibg=NONE    guifg=#edd400
hi Boolean      guibg=NONE    guifg=#ce5c00

hi Identifier   guibg=NONE    guifg=#729fcf
hi Function     guibg=NONE    guifg=#f57900
hi Class        guibg=NONE    guifg=#f57900
hi Statement    guibg=NONE    guifg=#eeeeec gui=bold
hi PreProc      guibg=NONE    guifg=#ad7fa8
hi Include      guibg=NONE    guifg=#ad7fa8
hi Type         guibg=NONE    guifg=#8ae234 gui=bold
hi Special      guibg=NONE    guifg=#fcaf3e

hi Error        guibg=#cc0000 guifg=#eeeeec gui=bold
hi Todo         guibg=#fce94f guifg=#888a85 gui=bold

hi clear Search
hi Search       guibg=#555753 guifg=NONE

" XML Colors
hi link xmlTag Identifier
hi link xmlEndTag xmlTag
hi link xmlTagName xmlTag
hi link xmlString String

" HTML Colors
hi link htmlTag Normal
hi link htmlEndTag Normal
hi link htmlTagName Normal
hi link htmlString xmlString
hi link htmlSpecialChar PreProc
hi link htmlH1 Normal
hi link htmlH2 Normal
hi link htmlH3 Normal
hi link htmlH4 Normal
hi link htmlH5 Normal
hi link htmlH6 Normal

" Jinja colors
hi link jinjaTagDelim Statement
hi link jinjaStatement Statement
hi link jinjaVarDelim jinjaTagDelim
hi link jinjaFilter Special
hi link jinjaString xmlString
hi link jinjaVarDelim Statement

" PHP Colors
hi link phpVarSelector Identifier
hi link phpIdentifier Identifier
hi link phpParent Normal
hi link phpFunctions Function
hi link phpClasses Class
hi link phpSpecial Special
hi link phpMemberSelector Keyword
hi link phpBoolean Boolean
hi link phpNumber Number
hi link phpStringSingle String
hi link phpInclude Include

" Reset SQL
hi link sqlKeyword String " do not highlight words like 'from' in php strings
hi link sqlStatement String " do not highlight workds like 'comment' in php strings
