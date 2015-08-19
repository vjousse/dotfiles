call Pl#Hi#Allocate({
	\ 'darkestgreen'   : 22,
	\ 'darkgreen'      : 28,
	\ 'mediumgreen'    : 70,
	\ 'brightgreen'    : 148,
	\
	\ 'darkestcyan'    : 23,
	\ 'mediumcyan'     : 117,
	\
	\ 'darkestblue'    : 24,
	\ 'darkblue'       : 31,
	\
	\ 'darkestred'     : 52,
	\ 'darkred'        : 88,
	\ 'mediumred'      : 124,
	\ 'brightred'      : 160,
	\ 'brightestred'   : 196,
	\
	\ 'darkestpurple'  : 55,
	\ 'mediumpurple'   : 98,
	\ 'brightpurple'   : 189,
	\
	\ 'brightorange'   : 208,
	\ 'brightestorange': 214,
	\
	\ 'g0'          : 233,
	\ 'g1'          : 235,
	\ 'g2'          : 236,
	\ 'g3'          : 239,
	\ 'g4'          : 240,
	\ 'g5'          : 241,
	\ 'g6'          : 244,
	\ 'g7'          : 245,
	\ 'g8'          : 247,
	\ 'g9'          : 250,
	\ 'g10'         : 252,
	\ 'b15'         : [8, 0x002b36],
	\ 'b20'         : [0, 0x073642],
	\ 'b45'         : [10, 0x586e75],
	\ 'b50'         : [11, 0x657b83],
	\ 'b60'          : [12, 0x839496],
	\ 'b65'          : [14, 0x93a1a1],
	\ 'b92'          : [7, 0xeee8d5],
	\ 'b97'          : [15, 0xfdf6e3],
	\ 'yellow'         : [3, 0xb58900],
	\ 'orange'         : [9, 0xcb4b16],
	\ 'red'            : [1, 0xdc322f],
	\ 'magenta'        : [5, 0xd33682],
	\ 'violet'         : [13, 0x6c71c4],
	\ 'blue'           : [4, 0x268bd2],
	\ 'cyan'           : [6, 0x2aa198],
	\ 'green'          : [2, 0x859900],
	\ })

let g:Powerline#Colorschemes#solarizedDarkLC#colorscheme = Pl#Colorscheme#Init([
	\ Pl#Hi#Segments(['SPLIT'], {
		\ 'n': ['b20', 'b15'],
		\ 'N': ['b65', 'b15'],
		\ 'i': ['b65', 'b20'],
		\ }),
	\
	\ Pl#Hi#Segments(['mode_indicator'], {
		\ 'n': ['b15', 'green'],
		\ 'i': ['blue', 'b20'],
		\ 'v': ['b15', 'orange'],
		\ 'r': ['b92', 'red'],
		\ 's': ['b92', 'b65'],
		\ }),
	\
	\ Pl#Hi#Segments(['scrollpercent'], {
		\ 'n': ['b50', 'b20'],
		\ 'N': ['b50', 'b20'],
		\ 'i': ['b20', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['branch', 'raw', 'filesize'], {
		\ 'n': ['b50', 'b20'],
		\ 'N': ['b50', 'b20'],
		\ 'i': ['b20', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo', 'filename'], {
		\ 'n': ['b65', 'b20'],
		\ 'N': ['b65', 'b45'],
		\ 'i': ['b20', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.filepath', 'status'], {
		\ 'n': ['b45'],
		\ 'N': ['b50'],
		\ 'i': ['b20'],
		\ }),
	\
	\ Pl#Hi#Segments(['static_str'], {
		\ 'n': ['b65', 'b20'],
		\ 'N': ['b65', 'b45'],
		\ 'i': ['b20', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['fileinfo.flags'], {
		\ 'n': ['red'],
		\ 'N': ['red'],
		\ 'i': ['red'],
		\ }),
	\
	\ Pl#Hi#Segments(['current_function', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'rvm:string', 'rvm:statusline', 'virtualenv:statusline', 'charcode', 'currhigroup'], {
		\ 'n': ['b50', 'b20'],
		\ 'i': ['b20', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo'], {
		\ 'n': ['b15', 'b50'],
		\ 'N': ['b65', 'b45'],
		\ 'i': ['b65', 'b20'],
		\ }),
	\
	\ Pl#Hi#Segments(['errors'], {
		\ 'n': ['orange', 'b15'],
		\ 'i': ['orange', 'b20'],
		\ }),
	\
	\ Pl#Hi#Segments(['lineinfo.line.tot'], {
		\ 'n': ['b65'],
		\ 'N': ['b50'],
		\ 'i': ['b45'],
		\ }),
	\
	\ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
		\ 'n': ['b15', 'red'],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:static_str.name', 'command_t:static_str.name'], {
		\ 'n': ['b92', 'mediumred'],
		\ 'N': ['brightred', 'darkestred'],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:static_str.buffer', 'command_t:raw.line'], {
		\ 'n': ['b92', 'darkred'],
		\ 'N': ['brightred', 'darkestred'],
		\ }),
	\
	\ Pl#Hi#Segments(['gundo:SPLIT', 'command_t:SPLIT'], {
		\ 'n': ['b92', 'darkred'],
		\ 'N': ['b92', 'darkestred'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:static_str.name', 'minibufexplorer:static_str.name', 'nerdtree:raw.name', 'tagbar:static_str.name'], {
		\ 'n': ['b92', 'mediumgreen'],
		\ 'N': ['mediumgreen', 'darkestgreen'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:static_str.buffer', 'tagbar:static_str.buffer'], {
		\ 'n': ['brightgreen', 'darkgreen'],
		\ 'N': ['mediumgreen', 'darkestgreen'],
		\ }),
	\
	\ Pl#Hi#Segments(['lustyexplorer:SPLIT', 'minibufexplorer:SPLIT', 'nerdtree:SPLIT', 'tagbar:SPLIT'], {
		\ 'n': ['b92', 'darkgreen'],
		\ 'N': ['b92', 'darkestgreen'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:focus', 'ctrlp:byfname'], {
		\ 'n': ['b15', 'violet'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:prev', 'ctrlp:next'], {
		\ 'n': ['b45', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:pwd'], {
		\ 'n': ['b45', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:item'], {
		\ 'n': ['b15', 'violet'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:marked'], {
		\ 'n': ['red', 'b15'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:count'], {
		\ 'n': ['violet', 'b92'],
		\ }),
	\
	\ Pl#Hi#Segments(['ctrlp:SPLIT'], {
		\ 'n': ['b20', 'b15'],
		\ }),
	\ ])
