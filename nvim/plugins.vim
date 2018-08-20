let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

if &compatible
 set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein') " Let Dein manage Dein

 call dein#add('scrooloose/nerdtree')
 call dein#add('rakr/vim-one')
 call dein#add('sheerun/vim-polyglot')
 call dein#add('christoomey/vim-tmux-navigator')
 call dein#add('mhinz/vim-sayonara')
 call dein#add('mhinz/vim-grepper', { 'on_cmd': 'Grepper' })
 call dein#add('janko-m/vim-test', { 'on_cmd': ['TestNearest', 'TestFile', 'TestLast'] })
 call dein#add('cloudhead/neovim-fuzzy')
 call dein#add('vim-airline/vim-airline')
 call dein#add('tpope/vim-commentary')
 call dein#add('jgdavey/vim-blockle', { 'on_ft': 'ruby' })
 call dein#add('w0rp/ale')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

silent call dein#install()

" Airline
let g:airline_theme = "one"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_highlighting_cache = 1

" Vim-Test
let test#strategy = "neovim"
let test#ruby#bundle_exec = 1
let test#ruby#use_binstubs = 0
let test#ruby#rspec#options = {
  \ 'nearest':    '--format documentation',
  \ 'file':    '--format documentation',
\}

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

" Grepper-Config
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Search for word under cursor with Ag
  nnoremap K :Grepper -tool ag -cword -noprompt -grepprg ag<cr>

  " Search for TODOs with Ag
  nnoremap ! :Grepper -tool ag -noprompt -grepprg ag "TODO( Stefan)?:"<cr>

  " Command :Ag to search
  command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag '<args>'
endif
