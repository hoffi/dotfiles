let loaded_netrw = 1
let loaded_netrwPlugin = 1

call plug#begin('~/.dotfiles/vim/plugged')
Plug 'justinmk/vim-dirvish'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby', 'on': 'BlockToggle' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
" Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-grepper', { 'on': 'Grepper' }
Plug 'janko-m/vim-test', { 'on': ['TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit'] }
Plug 'w0rp/ale', { 'for': ['ruby', 'javascript', 'elixir'] }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
call plug#end()

set mouse=a
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set hidden
set ignorecase smartcase
set number
set lazyredraw
set splitbelow splitright
" set cursorline
set noerrorbells visualbell t_vb=
set formatoptions=tjlnwc
set regexpengine=1
set synmaxcol=250

let mapleader=" "
let g:mapleader=" "
set encoding=utf-8
set ffs=unix,mac,dos
set cc=81
set textwidth=80

set background=dark
colorscheme onehalfdark
let g:airline_theme = 'onehalfdark'
let g:airline_extensions = ['tabline']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_tab_type = 0

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
let &fillchars = 'diff: '  " ▚
let &showbreak = '↪ '
highlight VertSplit ctermfg=242

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

nmap - :Dirvish %<CR>
let g:dirvish_mode = ':sort r /[^\/]$/'
function Dmkdir(path)
  :silent exec "!mkdir %" . a:path
  :silent edit
endfunction

augroup my_dirvish_events
  autocmd!
  " Jump back to project root
  au FileType dirvish nnoremap <silent><buffer> _ :exec 'pwd \| Dirvish'<CR>

  " File edit mappings
  au FileType dirvish
    \ nnoremap <buffer> maf :e %
    \| nnoremap <buffer> mad :call Dmkdir("")<left><left>
    \| noremap <buffer> md :Shdo rm -r {}<CR>
    \| noremap <buffer> mc :Shdo cp -R {} {}
    \| noremap <buffer> mm :Shdo mv {} {}
augroup END
