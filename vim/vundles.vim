call plug#begin()
""" General
" Enables % keybinding for many languages
Plug 'vim-scripts/matchit.zip'
" Run Async commands with tmux
Plug 'tpope/vim-dispatch', { 'on': 'Dispatch' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
" Minimalist start screen
Plug 'mhinz/vim-startify'

""" Appearance
" Theme
Plug 'reedes/vim-colors-pencil'
" Contains Syntax Highlighting for much languages
Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-airline'
" Distraction Free Writing
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'

""" Ruby specific
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
" Puts end for if, for, do, def, etc...
Plug 'tpope/vim-endwise'
Plug 'skalnik/vim-vroom', { 'on': ['VroomRunLastTest', 'VroomRunNearestTest', 'VroomRunTestFile'] }

""" Editing
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
Plug 'Shougo/unite.vim'
Plug 'rking/ag.vim'
" File Browser
Plug 'Shougo/vimfiler'
call plug#end()
