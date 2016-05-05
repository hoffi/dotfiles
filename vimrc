set nocompatible
call plug#begin('~/.dotfiles/vim/plugged')
Plug 'rstacruz/vim-opinion'
Plug 'christophermca/meta5'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'benekastah/neomake'
Plug 'rhysd/clever-f.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'
Plug 'skalnik/vim-vroom', { 'for': 'ruby' } | Plug 'benmills/vimux', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' } " Puts end for if, for, do, def, etc...
Plug 'tomtom/tcomment_vim' " gcc command to comment out code
Plug 'Raimondi/delimitMate' " Automatic closing of brackets, quotes, ...
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1

if has('nvim')
  let g:loaded_python_provider = 1
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

let g:mapleader=" "
set encoding=utf-8
set ffs=unix,mac,dos
set cc=81
set textwidth=80
set splitbelow
set splitright

" Faster key bindings
set timeoutlen=200
set ttimeoutlen=200

autocmd BufWritePre * silent! :%s/\s\+$//e " i dont like trailing whitespaces

" --- Abbreviations ----
autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example
autocmd FileType ruby iab <buffer> screenshot! page.save_screenshot 'test.png', full: true
autocmd FileType javascript inoremap <buffer> ƒ function() {<CR>}<up><end><left><left><left>

set t_Co=256
set background=dark
colorscheme meta5
let g:airline_theme = 'dark'
let g:airline_extensions = ['tabline', 'quickfix']

" I don't want c to copy anything..
noremap <silent> c "_c

noremap <silent> Y y$
nnoremap <leader>w :w<CR>
map 0 ^
nnoremap <silent> <leader>h :bp<CR>
nnoremap <silent> <leader>l :bn<CR>
map // :nohlsearch<CR>
nmap Q :bdelete<CR>
nmap QQ :bdelete!<CR>
vnoremap < <gv
vnoremap > >gv
nmap <leader>n :NERDTreeFind<CR>

" ------ syntastic and neomake -------
if has('nvim')
  autocmd! BufWritePost *.rb,*.js Neomake
endif
let g:neomake_javascript_enabled_makers = ['eslint']

" ------ Goyo ------
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set scrolloff=4
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -l --ignore ".git" --hidden -g ""'
nnoremap <silent><leader>f :Files<CR>
nnoremap <silent><leader>b :Buffers<CR>

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

if &shell =~# 'fish$'
  set shell=sh
endif
