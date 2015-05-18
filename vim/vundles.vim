" ========================================
" Vim plugin configuration
" ========================================
"
" This file contains the list of plugin installed using vundle plugin manager.
" Once you've updated the list of plugin, you can run vundle update by issuing
" the command :BundleInstall from within vim or directly invoking it from the
" command line with the following syntax:
" vim --noplugin -u vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
" Filetype off is required by vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ----- VUNDLES -----

""" General
Bundle "gmarik/vundle"
Bundle "Shougo/vimproc.vim"
" Enables % keybinding for many languages
Bundle "vim-scripts/matchit.zip"
" Run Async commands with tmux
Bundle "tpope/vim-dispatch.git"
Bundle "christoomey/vim-tmux-navigator"
" Syntax checker. Need async rubocop checks :)
Bundle "osyo-manga/vim-watchdogs"
Bundle "thinca/vim-quickrun"
Bundle "osyo-manga/shabadou.vim"
Bundle "jceb/vim-hier"
Bundle "dannyob/quickfixstatus"
Bundle "tpope/vim-fugitive"
Bundle "gregsexton/gitv"

""" Appearance
" Theme
Bundle "nanotech/jellybeans.vim"
" Contains Syntax Highlighting for much languages
Bundle "sheerun/vim-polyglot"
" Dims inactive Splits
Bundle "blueyed/vim-diminactive"
Bundle "bling/vim-airline"
" Distraction Free Writing
Bundle "junegunn/goyo.vim"
Bundle "junegunn/limelight.vim"

""" Ruby specific
Bundle "vim-ruby/vim-ruby.git"
Bundle "tpope/vim-rails.git"
" Puts end for if, for, do, def, etc...
Bundle "tpope/vim-endwise.git"
Bundle "hoffi/vim-vroom.git"

""" Editing
" Tab Autocomplete !
Bundle "ervandew/supertab.git"
" gcc command to comment out code
Bundle "tomtom/tcomment_vim.git"
Bundle "briandoll/change-inside-surroundings.vim.git"
" Automatic closing of brackets, quotes, ...
Bundle "Raimondi/delimitMate"

""" Project
Bundle "Shougo/unite.vim"
Bundle "Shougo/unite-outline.git"
" File Browser
Bundle "Shougo/vimfiler"

" -------------------

"Filetype plugin indent on is required by vundle
filetype plugin indent on
