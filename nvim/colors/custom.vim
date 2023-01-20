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
"- 0: Black  4: Blue
"- 1: Red    5: Magenta  + 8 bright version
"- 2: Green  6: Cyan 
"- 3: Yellow 7: White
"- 16: Background color

hi StatusLineEnd ctermfg=16 ctermbg=16

hi NormalModeColor ctermfg=16 ctermbg=14 cterm=bold
hi NormalModeSep ctermfg=14 ctermbg=3

hi VisualModeColor ctermfg=16 ctermbg=7 cterm=bold
hi VisualModeSep ctermfg=7 ctermbg=3

hi VisualLineModeColor ctermfg=16 ctermbg=15 cterm=bold
hi VisualLineModeSep ctermfg=15 ctermbg=3

hi VisualBlockModeColor ctermfg=16 ctermbg=15 cterm=bold
hi VisualBlockModeSep ctermfg=15 ctermbg=3

hi SelectModeColor ctermfg=16 ctermbg=7 cterm=bold
hi SelectModeSep ctermfg=7 ctermbg=3

hi SelectLineModeColor ctermfg=16 ctermbg=15 cterm=bold
hi SelectLineModeSep ctermfg=15 ctermbg=3

hi SelectBlockModeColor ctermfg=16 ctermbg=15 cterm=bold
hi SelectBlockModeSep ctermfg=15 ctermbg=3

hi InsertModeColor ctermfg=16 ctermbg=2 cterm=bold
hi InsertModeSep ctermfg=2 ctermbg=3

hi ReplaceModeColor ctermfg=16 ctermbg=1 cterm=bold
hi ReplaceModeSep ctermfg=1 ctermbg=3

hi VisualReplaceModeColor ctermfg=16 ctermbg=9 cterm=bold
hi VisualReplaceModeSep ctermfg=9 ctermbg=3

hi CommandModeColor ctermfg=16 ctermbg=5 cterm=bold
hi CommandModeSep ctermfg=5 ctermbg=3

hi VimExModeColor ctermfg=16 ctermbg=5 cterm=bold
hi VimExModeSep ctermfg=5 ctermbg=3

hi ExModeColor ctermfg=16 ctermbg=5 cterm=bold
hi ExModeSep ctermfg=5 ctermbg=3

hi PromptModeColor ctermfg=16 ctermbg=5 cterm=bold
hi PromptModeSep ctermfg=5 ctermbg=3

hi ShellModeColor ctermfg=16 ctermbg=5 cterm=bold
hi ShellModeSep ctermfg=5 ctermbg=3

hi TerminalModeColor ctermfg=16 ctermbg=5 cterm=bold
hi TerminalModeSep ctermfg=5 ctermbg=3

hi FilenameColor ctermfg=16 ctermbg=3
hi FilenameSepColor ctermfg=3 ctermbg=16
