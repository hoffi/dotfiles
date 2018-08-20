source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/keybindings.vim

set background=dark
colorscheme one
set termguicolors
set lazyredraw
set textwidth=80 cc=81
set ffs=unix,mac,dos
set encoding=utf-8

set mouse=a
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab wrap
set number

set noerrorbells novisualbell t_vb=
set synmaxcol=250

set formatoptions=tjlnwc

autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example
autocmd FileType ruby iab <buffer> screenshot! page.save_screenshot 'test.png', full: true

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWritePre * silent! :call DeleteTrailingWS()
