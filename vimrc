set nocompatible
call plug#begin('~/.dotfiles/vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-grepper'
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
Plug 'w0rp/ale'
call plug#end()

augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nowrap
set noesckeys
set ignorecase
set smartcase
set number
set lazyredraw
set splitbelow
set switchbuf=useopen
set cursorline

if has('guicolors')
  set guicolors
endif
if has('termguicolors')
  set termguicolors
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

  let g:python_host_prog = '/usr/bin/python'

  " https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

let mapleader=" "
let g:mapleader=" "
set encoding=utf-8
set ffs=unix,mac,dos
set cc=81
set textwidth=80

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

autocmd FileType netrw setl bufhidden=wipe

colorscheme one
set background=dark
let g:one_allow_italics = 1
let g:airline_theme = 'one'
let g:airline_extensions = ['quickfix', 'tabline', 'ctrlp']

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
let g:ctrlp_reuse_window = 'netrw\|help'
let g:ctrlp_lazy_update = 60
nnoremap <leader>sb :CtrlPBuffer<CR>

if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore ".git" -i'
  nnoremap K :Grepper -tool ag -cword -noprompt -grepprg ag --nocolor<cr>
  command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --nocolor '<args>'
endif

if has('nvim')
  let test#strategy = "neovim"
end
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_splits = 1

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
func! CreateOrReuseNetrw()
  if exists("w:netrw_rexlocal")
    Rexplore
  else
    let s:filename = expand("%:t")
    Explore %:p:h
    execute '/ ' . s:filename . '$'
    noh
  end
endfunc

nmap - :call CreateOrReuseNetrw()<CR>
