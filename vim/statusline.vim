" STATUSLINE CONFIG

function! StatusLineColor(mode)
  if a:mode == "i"
    hi StatusLine ctermfg=yellow ctermbg=0
    hi User2 ctermfg=88 ctermbg=yellow cterm=bold
  elseif a:mode == "r"
    hi StatusLine ctermfg=1 ctermbg=white
    hi User2 ctermfg=3  ctermbg=1 cterm=bold
  else
    hi User2 ctermfg=88 ctermbg=2 cterm=bold
    hi StatusLine ctermfg=2 ctermbg=black
  endif
endfunction

function! StatusText(mode)
  if a:mode == "i"
    return "INSERT"
  elseif a:mode == "n"
    return "NORMAL"
  elseif a:mode == "R"
    return "REPLACE"
  elseif a:mode == "v"
    return "VISUAL"
  elseif a:mode == "V"
    return "V-LINE"
  else
    return toupper(a:mode)
  endif
endfunction

au InsertEnter * call StatusLineColor(v:insertmode)
au InsertLeave * call StatusLineColor(mode())

set statusline=%<\ %{StatusText(mode())}
set statusline+=\ \|\ %t%2*%m%r%h%w%*
set statusline+=%=
set statusline+=%1*%{SyntasticStatuslineFlag()}%*
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}%y

