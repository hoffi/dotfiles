let loaded_netrw = 1
let loaded_netrwPlugin = 1

call plug#begin('~/.dotfiles/vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'cocopon/vaffle.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby', 'on': 'BlockToggle' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
Plug 'w0rp/ale', { 'for': ['ruby', 'javascript', 'elixir'] }
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

set mouse=a
set hidden
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab wrap
set ignorecase smartcase
set number laststatus=2
set lazyredraw
set splitbelow splitright
set noerrorbells visualbell t_vb=
set formatoptions=tjlnwc
set noshowcmd noshowmode
set synmaxcol=250

let mapleader=" "
let g:mapleader=" "
set encoding=utf-8
set ffs=unix,mac,dos
set textwidth=80 cc=81

set termguicolors
" let ayucolor="light"
" let ayucolor="mirage"
let ayucolor="dark"
colorscheme ayu

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

nnoremap <leader>w :w<CR>
nnoremap <silent> <C-P> :bp<CR>
nnoremap <silent> <C-N> :bn<CR>
map // :nohlsearch<CR>
vnoremap < <gv
vnoremap > >gv
nmap Q :Sayonara<CR>
map 0 ^

let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
let &showbreak = '↪ '

let g:ctrlp_map = '<leader>f'
let g:ctrlp_lazy_update = 60

if executable('ag')
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s --nocolor -g "" --ignore ".git"'
  set grepprg=ag\ --nogroup\ --nocolor

  " Search for word under cursor with Ag
  nnoremap K :Grepper -tool ag -cword -noprompt -grepprg ag --nocolor<cr>

  " Command :Ag to search
  command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --nocolor '<args>'
endif

if has('nvim')
  set t_ut=
  let test#ruby#bundle_exec = 1
  let test#ruby#use_binstubs = 0
  let test#strategy = "neovim"

  " https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
  nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
endif

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
let test#ruby#rspec#options = {
  \ 'nearest':    '--format documentation',
  \ 'file':    '--format documentation',
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

function! s:customize_vaffle_mappings() abort
  nmap - <Plug>(vaffle-open-parent)
endfunction
augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
  autocmd FileType * nmap - :Vaffle %:p:h<CR>
augroup END

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_highlighting_cache = 1
let g:airline_extensions = ['ctrlp', 'quickfix', 'tabline', 'ale']
let g:airline_theme='serene'
