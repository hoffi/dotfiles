set nocompatible
runtime macros/matchit.vim
call plug#begin('~/.dotfiles/vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' } " Puts end for if, for, do, def, ...
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tomtom/tcomment_vim' " gcc command to comment out code
Plug 'Raimondi/delimitMate' " Automatic closing of brackets, quotes, ...
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-grepper'
Plug 'janko-m/vim-test' " Testrunner
Plug 'w0rp/ale' " Linter
call plug#end()

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

set history=100
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
if has('guicolors')
  set guicolors
endif
if has('termguicolors')
  set termguicolors
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

let mapleader=" "
let g:mapleader=" "
set encoding=utf-8
set ffs=unix,mac,dos
set cc=81
set textwidth=80
set splitbelow
set numberwidth=4
set switchbuf=useopen
set cursorline

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

colorscheme OceanicNext
set background=dark
let g:airline_theme = 'oceanicnext'
let g:airline_extensions = ['tabline', 'quickfix', 'ctrlp']

nnoremap <leader>w :w<CR>
map 0 ^
nnoremap <silent> <C-P> :bp<CR>
nnoremap <silent> <C-N> :bn<CR>
map // :nohlsearch<CR>
nmap Q :bdelete<CR>
nmap <leader>Q :bwipeout<CR>
vnoremap < <gv
vnoremap > >gv

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
nnoremap <leader>sb :CtrlPBuffer<CR>

if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore ".git" -i'
  nnoremap K :Grepper -tool ag -cword -noprompt -grepprg ag --nocolor<cr>
  command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --nocolor '<args>'
endif


" ---- vim-test settings ----
if has('nvim')
  let test#strategy = "dispatch"
end
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" ---- airline ----
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
nmap - :edit .<CR>

if &shell =~# 'fish$'
  set shell=sh
endif
