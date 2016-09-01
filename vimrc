set nocompatible
call plug#begin('~/.dotfiles/vim/plugged')
Plug 'croaker/mustang-vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree' | Plug 'svenwin/vim-splitted-nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'mhinz/vim-grepper'
Plug 'vim-airline/vim-airline'
Plug 'skalnik/vim-vroom', { 'for': 'ruby' } | Plug 'benmills/vimux', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' } " Puts end for if, for, do, def, etc...
Plug 'tomtom/tcomment_vim' " gcc command to comment out code
Plug 'Raimondi/delimitMate' " Automatic closing of brackets, quotes, ...
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/AutoComplPop'
call plug#end()

set history=100
set autoread
set mouse=a

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set nowrap
set noesckeys

set cindent
set showmatch
set matchtime=4

set hlsearch
set incsearch
set ignorecase
set smartcase

set number
set numberwidth=4
set cmdheight=1
set so=5
set sidescrolloff=3
set laststatus=2
set ttyfast
set lazyredraw

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

let loaded_netrwPlugin = 1
let mapleader=" "
let g:mapleader=" "
set encoding=utf-8
set ffs=unix,mac,dos
set cc=81
set textwidth=80
set splitbelow
set numberwidth=4
set switchbuf=useopen

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWritePre * silent! :call DeleteTrailingWS()

" --- Abbreviations ----
autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example
autocmd FileType ruby iab <buffer> screenshot! page.save_screenshot 'test.png', full: true

colorscheme mustang
set background=dark
let g:airline_theme = 'dark'
let g:airline_extensions = ['tabline', 'quickfix', 'ctrlp']

noremap <silent> Y y$
nnoremap <leader>w :w<CR>
map 0 ^
nnoremap <silent> <C-P> :bp<CR>
nnoremap <silent> <C-N> :bn<CR>
map // :nohlsearch<CR>
nmap Q :bdelete<CR>
nmap <leader>Q :bwipeout<CR>
vnoremap < <gv
vnoremap > >gv
nmap - :call splittednerdtree#revealFile()<CR>

let g:buffergator_autoupdate = 1
let g:buffergator_sort_regime = 'mru'
let g:buffergator_suppress_keymaps = 1
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_vsplit_size = 25
let g:buffergator_hsplit_size = 5
let g:buffergator_viewport_split_policy = 'R'
nmap <leader>t :BuffergatorOpen<CR>
nmap <leader>T :BuffergatorClose<CR>

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_reuse_window = 'dirvish\|help\|quickfix'
nnoremap <leader>sb :CtrlPBuffer<CR>

if executable('ag')
	" ag is so fast
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore ".git" --hidden -i'
  nnoremap K :Grepper -tool ag -cword -noprompt -grepprg ag --nocolor<cr>
  command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --nocolor '<args>'
endif

" ------ syntastic and neomake -------
if has('nvim')
  autocmd! BufWritePost *.rb Neomake
endif

" ---- vim-vroom settings ----
let g:vroom_use_vimux = 1
let g:vroom_use_bundle_exec = 1
let g:vroom_use_zeus = 1 " Always use zeus when it is running!

" ---- airline ----
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:NERDTreeHijackNetrw = 1
let g:NERDTreeAutoDeleteBuffer = 1

if &shell =~# 'fish$'
  set shell=sh
endif
