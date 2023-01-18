syntax reset
let g:colors_name = "custom"
set t_Co=256

"Syntax
hi Normal      ctermfg=15
hi Comment     ctermfg=8
hi LineNr      ctermfg=8

hi Constant    ctermfg=6
hi String      ctermfg=11 
hi Character   ctermfg=11 cterm=bold
hi Boolean     ctermfg=6  cterm=bold

hi Identifier  ctermfg=5
hi Function    ctermfg=5  cterm=bold

hi Statement   ctermfg=1 
hi Operator    ctermfg=13 cterm=bold
hi Keyword     ctermfg=13
hi Exception   ctermfg=1  cterm=italic

hi PreProc     ctermfg=14  
hi Include     ctermfg=14 cterm=italic
hi Define      ctermfg=14 cterm=italic
hi PreCondit   ctermfg=14 cterm=italic

hi Type        ctermfg=2  cterm=bold
hi Structure   ctermfg=3  cterm=bold
hi Typedef     ctermfg=3  cterm=bold

hi SpecialChar ctermfg=1  cterm=bold

hi Error       ctermfg=0  ctermbg=9

hi Todo        ctermfg=2  ctermbg=12

" Floating windows
hi NormalFloat ctermbg=17
hi FloatBorder ctermfg=8

" Diagnostics 
hi DiagnosticUnderlineError cterm=undercurl guisp=#fa74b2
hi DiagnosticUnderlineWarn cterm=undercurl guisp=#fa946e
hi DiagnosticUnderlineInfo cterm=undercurl guisp=#7acbea
hi DiagnosticUnderlineHint cterm=undercurl guisp=#efefef

" Status line
hi NormalModeColor ctermfg=16 ctermbg=14 cterm=bold
hi NormalModeSep ctermfg=14 ctermbg=16
