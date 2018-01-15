let s:cterm00 = "00"
let s:cterm03 = "03"
let s:cterm05 = "05"
let s:cterm07 = "07"
let s:cterm08 = "08"
let s:cterm0A = "10"
let s:cterm0B = "11"
let s:cterm0C = "12"
let s:cterm0D = "13"
let s:cterm0E = "14"
if exists('base16colorspace') && base16colorspace == "256"
  let s:cterm01 = "01"
  let s:cterm02 = "02"
  let s:cterm04 = "04"
  let s:cterm06 = "06"
  let s:cterm09 = "09"
  let s:cterm0F = "15"
else
  let s:cterm01 = "01"
  let s:cterm02 = "02"
  let s:cterm04 = "04"
  let s:cterm06 = "06"
  let s:cterm09 = "09"
  let s:cterm0F = "15"
endif

" Theme Setup
hi clear
syntax reset
let g:colors_name = "material"

" Highlighting Function
fun <sid>hi(group, ctermfg, ctermbg, attr)
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . s:cterm(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . s:cterm(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
endfun

" Return Color for Light/Dark Variants
fun s:cterm(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:cterm00
    return s:cterm0E
  elseif a:color == s:cterm08
    return s:cterm0C
  elseif a:color == s:cterm0B
    return s:cterm0E
  elseif a:color == s:cterm08
    return s:cterm0D
  elseif a:color == s:cterm0D
    return s:cterm0A
  elseif a:color == s:cterm0E
    return s:cterm0B
  elseif a:color == s:cterm0C
    return s:cterm08
  elseif a:color == s:cterm0E
    return s:cterm00
  endif

  return a:color
endfun

" Vim Editor Colors
call <sid>hi("Bold",          "", "", "bold")
call <sid>hi("Debug",         s:cterm08, "", "")
call <sid>hi("Directory",     s:cterm0E, "", "")
call <sid>hi("ErrorMsg",      s:cterm08, s:cterm00, "")
call <sid>hi("Exception",     s:cterm07, "", "")
call <sid>hi("FoldColumn",    "", s:cterm08, "")
call <sid>hi("Folded",        s:cterm08, s:cterm08, "")
call <sid>hi("IncSearch",     s:cterm08, s:cterm09, "none")
call <sid>hi("Italic",        "", "", "none")
call <sid>hi("Macro",         s:cterm08, "", "")
call <sid>hi("MatchParen",    s:cterm0A, s:cterm08,  "")
call <sid>hi("ModeMsg",       s:cterm07, "", "")
call <sid>hi("MoreMsg",       s:cterm07, "", "")
call <sid>hi("Question",      s:cterm07, "", "")
call <sid>hi("Search",        s:cterm08, s:cterm0A,  "")
call <sid>hi("SpecialKey",    s:cterm08, "", "")
call <sid>hi("TooLong",       s:cterm08, "", "")
call <sid>hi("Underlined",    s:cterm08, "", "")
call <sid>hi("Visual",        "", s:cterm08, "")
call <sid>hi("VisualNOS",     "", s:cterm08, "")
call <sid>hi("WarningMsg",    s:cterm08, "", "")
call <sid>hi("WildMenu",      s:cterm08, "", "")
call <sid>hi("Title",         s:cterm07, "", "none")
call <sid>hi("Conceal",       s:cterm07, s:cterm00, "")
call <sid>hi("Cursor",        "", s:cterm08, "")
call <sid>hi("NonText",       s:cterm08, "", "")
call <sid>hi("Normal",        s:cterm0F, s:cterm00, "")
call <sid>hi("LineNr",        s:cterm06, s:cterm00, "")
call <sid>hi("SignColumn",    s:cterm08, s:cterm08, "")
call <sid>hi("SpecialKey",    s:cterm0D, "", "")
call <sid>hi("StatusLine",    s:cterm0F, s:cterm08, "none")
call <sid>hi("StatusLineNC",  s:cterm06, s:cterm08, "none")
call <sid>hi("VertSplit",     s:cterm00, s:cterm00, "none")
call <sid>hi("ColorColumn",   "", s:cterm08, "none")
call <sid>hi("CursorColumn",  "", s:cterm08, "none")
call <sid>hi("CursorLine",    "", s:cterm08, "none")
call <sid>hi("CursorLineNr",  s:cterm08, s:cterm08, "")
call <sid>hi("PMenu",         s:cterm06, s:cterm08, "none")
call <sid>hi("PMenuSel",      s:cterm0A, s:cterm08, "")
call <sid>hi("TabLine",       s:cterm08, s:cterm08, "none")
call <sid>hi("TabLineFill",   s:cterm08, s:cterm08, "none")
call <sid>hi("TabLineSel",    s:cterm08, s:cterm08, "none")

" Standard Syntax Highlighting
call <sid>hi("Boolean",      s:cterm01, "", "none")
call <sid>hi("Character",    s:cterm0A, "", "none")
call <sid>hi("Comment",      s:cterm0E, "", "none")
call <sid>hi("Conditional",  s:cterm0D, "", "none")
call <sid>hi("Constant",     s:cterm01, "", "none")
call <sid>hi("Define",       s:cterm0D, "", "none")
call <sid>hi("Delimiter",    s:cterm0D, "", "none")
call <sid>hi("Float",        s:cterm01, "", "none")
call <sid>hi("Function",     s:cterm0C, "", "none")
call <sid>hi("Identifier",   s:cterm0D, "", "none")
call <sid>hi("Include",      s:cterm0D, "", "none")
call <sid>hi("Keyword",      s:cterm0D, "", "none")
call <sid>hi("Label",        s:cterm0C, "", "none")
call <sid>hi("Number",       s:cterm01, "", "none")
call <sid>hi("Operator",     s:cterm0E, "", "none")
call <sid>hi("PreProc",      s:cterm0E, "", "none")
call <sid>hi("Repeat",       s:cterm0D, "", "none")
call <sid>hi("Special",      s:cterm0E, "", "none")
call <sid>hi("SpecialChar",  s:cterm0D, "", "none")
call <sid>hi("Statement",    s:cterm0E, "", "none")
call <sid>hi("StorageClass", s:cterm0B, "", "none")
call <sid>hi("String",       s:cterm0A, "", "none")
call <sid>hi("Structure",    s:cterm0E, "", "none")
call <sid>hi("Tag",          s:cterm0E, "", "none")
call <sid>hi("Todo",         s:cterm0D, s:cterm00, "")
call <sid>hi("Type",         s:cterm0E, "", "none")
call <sid>hi("Typedef",      s:cterm0E, "", "none")

" C Highlighting
call <sid>hi("cOperator",  s:cterm0C, "", "")
call <sid>hi("cPreCondit", s:cterm06, "", "")
call <sid>hi("cType",      s:cterm0D, "", "")
call <sid>hi("cStatement", s:cterm0D, "", "")

" C++ Highlighting
call <sid>hi("cppStatement", s:cterm0D, "", "")

" C# Highlighting
call <sid>hi("csClass",                 s:cterm0A, "", "")
call <sid>hi("csAttribute",             s:cterm0A, "", "")
call <sid>hi("csModifier",              s:cterm06, "", "")
call <sid>hi("csType",                  s:cterm08, "", "")
call <sid>hi("csUnspecifiedStatement",  s:cterm0D, "", "")
call <sid>hi("csContextualStatement",   s:cterm06, "", "")
call <sid>hi("csNewDecleration",        s:cterm08, "", "")

" CSS highlighting
call <sid>hi("cssBraces",      s:cterm06, "", "")
call <sid>hi("cssClassName",   s:cterm06, "", "")
call <sid>hi("cssColor",       s:cterm0C, "", "")

" Diff Highlighting
call <sid>hi("DiffAdd",      s:cterm0E, s:cterm08, "")
call <sid>hi("DiffChange",   s:cterm08, s:cterm08, "")
call <sid>hi("DiffDelete",   s:cterm0C, s:cterm08, "")
call <sid>hi("DiffText",     s:cterm0D, s:cterm08, "")
call <sid>hi("DiffAdded",    s:cterm0C, s:cterm00, "")
call <sid>hi("DiffFile",     s:cterm0C, s:cterm00, "")
call <sid>hi("DiffNewFile",  s:cterm06, s:cterm00, "")
call <sid>hi("DiffLine",     s:cterm0D, s:cterm00, "")
call <sid>hi("DiffRemoved",  s:cterm0D, s:cterm00, "")

" Git Highlighting
call <sid>hi("gitCommitOverflow", s:cterm08, "", "")
call <sid>hi("gitCommitSummary",  s:cterm0D, "", "")

" GitGutter Highlighting
call <sid>hi("GitGutterAdd",          s:cterm0D, s:cterm08, "")
call <sid>hi("GitGutterChange",       s:cterm06, s:cterm08, "")
call <sid>hi("GitGutterDelete",       s:cterm0D, s:cterm08, "")
call <sid>hi("GitGutterChangeDelete", s:cterm06, s:cterm08, "")

" HTML Highlighting
call <sid>hi("htmlBold",    s:cterm0A, "", "")
call <sid>hi("htmlItalic",  s:cterm06, "", "")
call <sid>hi("htmlEndTag",  s:cterm0D, "", "")
call <sid>hi("htmlTag",     s:cterm0D, "", "")
call <sid>hi("htmlTagName", s:cterm0D, "", "")
call <sid>hi("htmlArg",     s:cterm0D, "", "")

" JavaScript Highlighting
call <sid>hi("javaScript",       s:cterm06, "", "")
call <sid>hi("javaScriptBraces", s:cterm06, "", "")
call <sid>hi("javaScriptNumber", s:cterm0D, "", "")

" Markdown Highlighting
call <sid>hi("markdownCode",             s:cterm0C, "", "")
call <sid>hi("markdownError",            s:cterm0B, s:cterm00, "")
call <sid>hi("markdownCodeBlock",        s:cterm0C, "", "")
call <sid>hi("markdownHeadingDelimiter", s:cterm0D, "", "")

" NERDTree Highlighting
call <sid>hi("NERDTreeFile",     s:cterm0E, "", "")
call <sid>hi("NERDTreeCWD",      s:cterm0F, "", "")
call <sid>hi("NERDTreeDirSlash", s:cterm0E, "", "")
call <sid>hi("NERDTreeExecFile", s:cterm0E, "", "")

" PHP highlighting
call <sid>hi("phpMemberSelector", s:cterm06, "", "")
call <sid>hi("phpComparison",     s:cterm06, "", "")
call <sid>hi("phpParent",         s:cterm06, "", "")

" Python Highlighting
call <sid>hi("pythonPreCondit",   s:cterm0D, "", "")
call <sid>hi("pythonDocString",   s:cterm0A, "", "")
call <sid>hi("pythonClassDef",    s:cterm0D, "", "")
call <sid>hi("pythonClassName",   s:cterm0B, "", "")
call <sid>hi("pythonSuperClass",  s:cterm0A, "", "")
call <sid>hi("pythonFuncDef",     s:cterm0D, "", "")
call <sid>hi("pythonFuncName",    s:cterm0C, "", "")
call <sid>hi("pythonBuiltinFunc", s:cterm01, "", "")
call <sid>hi("pythonNumber",      s:cterm09, "", "")
call <sid>hi("pythonOperator",    s:cterm0D, "", "")
call <sid>hi("pythonDecorator",   s:cterm0C, "", "")
call <sid>hi("pythonRepeat",      s:cterm0D, "", "")
call <sid>hi("pythonStatement",   s:cterm0D, "", "")
call <sid>hi("pythonBuiltin",     s:cterm06, "", "")

" Ruby Highlighting
call <sid>hi("rubyAttribute",              s:cterm0D, "", "")
call <sid>hi("rubyConstant",               s:cterm0A, "", "")
call <sid>hi("rubyInterpolation",          s:cterm0B, "", "")
call <sid>hi("rubyInterpolationDelimiter", s:cterm07, "", "")
call <sid>hi("rubyRegexp",                 s:cterm0C, "", "")
call <sid>hi("rubySymbol",                 s:cterm0B, "", "")
call <sid>hi("rubyStringDelimiter",        s:cterm0B, "", "")

" SASS Highlighting
call <sid>hi("sassidChar",    s:cterm08, "", "")
call <sid>hi("sassClassChar", s:cterm09, "", "")
call <sid>hi("sassInclude",   s:cterm06, "", "")
call <sid>hi("sassMixing",    s:cterm06, "", "")
call <sid>hi("sassMixinName", s:cterm0D, "", "")

" Signify Highlighting
call <sid>hi("SignifySignAdd",    s:cterm0B, s:cterm08, "")
call <sid>hi("SignifySignChange", s:cterm0D, s:cterm08, "")
call <sid>hi("SignifySignDelete", s:cterm08, s:cterm08, "")

" Spelling Highlighting
call <sid>hi("SpellBad",   "", s:cterm00, "undercurl")
call <sid>hi("SpellLocal", "", s:cterm00, "undercurl")
call <sid>hi("SpellCap",   "", s:cterm00, "undercurl")
call <sid>hi("SpellRare",  "", s:cterm00, "undercurl")

" Remove Functions
delf <sid>hi
delf <sid>cterm

" Remove Color Variables
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F