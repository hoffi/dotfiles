" STATUSLINE CONFIG

function! StatusLineColor(mode)
  redraw
  if a:mode == "i"
    hi StatusLine ctermfg=yellow ctermbg=0
    hi User2 ctermfg=88 ctermbg=yellow cterm=bold
    return "INSERT"
  elseif a:mode == "v"
    hi StatusLine ctermfg=magenta ctermbg=0
    hi User2 ctermfg=88 ctermbg=magenta cterm=bold
    return "VISUAL"
  elseif a:mode == "V"
    hi StatusLine ctermfg=magenta ctermbg=0
    hi User2 ctermfg=88 ctermbg=magenta cterm=bold
    return "V-LINE"
  elseif a:mode == "R"
    hi StatusLine ctermfg=1 ctermbg=white
    hi User2 ctermfg=3  ctermbg=1 cterm=bold
    return "REPLACE"
  elseif a:mode == "n"
    hi StatusLine ctermfg=2 ctermbg=black
    hi User2 ctermfg=88 ctermbg=2 cterm=bold
    return "NORMAL"
  else
    hi User2 ctermfg=88 ctermbg=2 cterm=bold
    hi StatusLine ctermfg=2 ctermbg=black
    return toupper(a:mode)
  endif
endfunction

set statusline=%<\ %{StatusLineColor(mode())}
set statusline+=\ \|\ %t%2*%m%r%h%w%*
set statusline+=%=
set statusline+=%1*%{SyntasticStatuslineFlag()}%*
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}%y
set statusline+=\ [line\ %l\/%L]\ %*

