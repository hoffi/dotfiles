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
" Enables % keybinding for many languages
Bundle "vim-scripts/matchit.zip"
" Run Async commands with tmux
Bundle "tpope/vim-dispatch.git"
Bundle "christoomey/vim-tmux-navigator"
Bundle "tpope/vim-fugitive"
" Minimalist start screen
Bundle 'mhinz/vim-startify'

""" Appearance
" Theme
Bundle "reedes/vim-colors-pencil"
" Contains Syntax Highlighting for much languages
Bundle "sheerun/vim-polyglot"
Bundle "bling/vim-airline"
" Distraction Free Writing
Bundle "junegunn/goyo.vim"
Bundle "junegunn/limelight.vim"

""" Ruby specific
Bundle "vim-ruby/vim-ruby.git"
Bundle "tpope/vim-rails.git"
" Puts end for if, for, do, def, etc...
Bundle "tpope/vim-endwise.git"
Bundle "skalnik/vim-vroom.git"

""" Editing
" Tab Autocomplete !
Bundle "ervandew/supertab.git"
" gcc command to comment out code
Bundle "tomtom/tcomment_vim.git"
Bundle "briandoll/change-inside-surroundings.vim.git"
" Automatic closing of brackets, quotes, ...
Bundle "Raimondi/delimitMate"
Bundle "benmills/vimux"

""" Project
Bundle "scrooloose/syntastic"
Bundle "kien/ctrlp.vim"
Bundle "Shougo/unite.vim"
Bundle "rking/ag.vim"
" File Browser
Bundle "Shougo/vimfiler"

" -------------------

"Filetype plugin indent on is required by vundle
filetype plugin indent on
