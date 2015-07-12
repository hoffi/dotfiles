call plug#begin()

""" General
" Enables % keybinding for many languages
Plug 'vim-scripts/matchit.zip'
" Run Async commands with tmux
Plug 'tpope/vim-dispatch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
" Minimalist start screen
Plug 'mhinz/vim-startify'

""" Appearance
" Theme
Plug 'NLKNguyen/papercolor-theme'
" Contains Syntax Highlighting for much languages
Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-airline'
" Distraction Free Writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'

""" Ruby specific
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'skalnik/vim-vroom', { 'for': 'ruby' }

""" Editing
" Puts end for if, for, do, def, etc...
Plug 'tpope/vim-endwise'
" Tab Autocomplete !
Plug 'ervandew/supertab'
" gcc command to comment out code
Plug 'tomtom/tcomment_vim'
Plug 'briandoll/change-inside-surroundings.vim'
" Automatic closing of brackets, quotes, ...
Plug 'Raimondi/delimitMate'
Plug 'benmills/vimux'

""" Project
if has('nvim')
  Plug 'benekastah/neomake'
else
  Plug 'scrooloose/syntastic'
endif
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
Plug 'Shougo/unite.vim'
Plug 'rking/ag.vim'
" File Browser
Plug 'Shougo/vimfiler'

call plug#end()
