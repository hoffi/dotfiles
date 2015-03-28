set background=dark
colorscheme gruvbox

" General GUI {{{
" Whitespace
highlight SpecialKey   ctermfg=235  guifg=#30302c
" Last search highlighting and quickfix's current line
highlight Search       ctermfg=183  ctermbg=237
" Brakets and pairs
highlight MatchParen   ctermfg=220  ctermbg=237
" Visual mode selection
highlight Visual       ctermbg=236

" }}}
" Statusline {{{
hi StatusLine ctermfg=2 ctermbg=black
hi StatusLineNC ctermfg=black ctermbg=239
" Syntastic Warning
hi User1 ctermfg=white ctermbg=red cterm=bold
" File Flags
hi User2 ctermfg=88 ctermbg=2 cterm=bold

" }}}
" Unite {{{
highlight uniteInputPrompt            ctermfg=237
highlight uniteCandidateMarker        ctermfg=143
highlight uniteCandidateInputKeyword  ctermfg=12

" }}}
" Grep {{{
highlight link uniteSource__Grep        Directory
highlight link uniteSource__GrepLineNr  qfLineNr
highlight uniteSource__GrepLine         ctermfg=245 guifg=#808070
highlight uniteSource__GrepFile         ctermfg=4   guifg=#8197bf
highlight uniteSource__GrepSeparator    ctermfg=5   guifg=#f0a0c0
highlight uniteSource__GrepPattern      ctermfg=1   guifg=#cf6a4c

" }}}
" VimFiler {{{
highlight vimfilerNormalFile  ctermfg=245 guifg=#808070
highlight vimfilerClosedFile  ctermfg=249 guifg=#a8a897
highlight vimfilerOpenedFile  ctermfg=254 guifg=#e8e8d3
highlight vimfilerNonMark     ctermfg=239 guifg=#4e4e43
highlight vimfilerLeaf        ctermfg=235 guifg=#30302c

