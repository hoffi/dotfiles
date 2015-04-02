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
set rtp+=~/.vim/vundles/ "Submodules
call vundle#rc()

" ----- VUNDLES -----

""" General
Bundle "gmarik/vundle"
Bundle "xolox/vim-misc"
Bundle "Shougo/vimproc.vim"
" Enables % keybinding for many languages
Bundle "vim-scripts/matchit.zip"
" Shows changes in gutter
Bundle "airblade/vim-gitgutter"
" Run Async commands with tmux
Bundle "tpope/vim-dispatch.git"
Bundle "christoomey/vim-tmux-navigator"
" Syntax checkers
Bundle "scrooloose/syntastic.git"

""" Appearance
" Theme
Bundle "morhetz/gruvbox"
" Contains Syntax Highlighting for much languages
Bundle "sheerun/vim-polyglot"
" Dims inactive Splits
Bundle "blueyed/vim-diminactive"
" Underlines all occurences of the word under cursor
Bundle "itchyny/vim-cursorword"
" Shows buffers in the tabline
Bundle "ap/vim-buftabline"

""" Ruby specific
Bundle "vim-ruby/vim-ruby.git"
Bundle "tpope/vim-rails.git"
" Puts end for if, for, do, def, etc...
Bundle "tpope/vim-endwise.git"

""" Editing
" Tab Autocomplete !
Bundle "ervandew/supertab.git"
" gcc command to comment out code
Bundle "tomtom/tcomment_vim.git"
Bundle "briandoll/change-inside-surroundings.vim.git"
Bundle "AndrewRadev/splitjoin.vim"
" Automatic closing of brackets, quotes, ...
Bundle "Raimondi/delimitMate"

""" Project
Bundle "Shougo/unite.vim"
Bundle "Shougo/unite-outline.git"
" File Browser
Bundle "Shougo/vimfiler"

" -------------------

" The plugins listed in ~/.vim/.vundles.local will be added here to
" allow the user to add vim plugins to yadr without the need for a fork.
if filereadable(expand("~/.yadr/vim/.vundles.local"))
  source ~/.yadr/vim/.vundles.local
endif

"Filetype plugin indent on is required by vundle
filetype plugin indent on
