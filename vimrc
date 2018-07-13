let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

call plug#begin('~/.dotfiles/vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'nightsense/night-and-day'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cocopon/vaffle.vim'
Plug 'cloudhead/neovim-fuzzy'
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

let base16colorspace=256
set termguicolors
let g:nd_themes = [
  \ ['6:00',  'base16-tomorrow',       'light', 'base16' ],
  \ ['19:00', 'base16-tomorrow-night', 'dark', 'base16_tomorrow' ]
  \ ]
let g:nd_airline = 1

set complete-=i
set complete-=d
set complete-=t

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

nnoremap <leader>f :FuzzyOpen<CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " Search for word under cursor with Ag
  nnoremap K :Grepper -tool ag -cword -noprompt -grepprg ag<cr>

  " Search for TODOs with Ag
  nnoremap ! :Grepper -tool ag -noprompt -grepprg ag "TODO( Stefan)?:"<cr>

  " Command :Ag to search
  command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag '<args>'
endif

if has('nvim')
  " set t_ut=
  let test#strategy = "neovim"
  let test#ruby#bundle_exec = 1
  let test#ruby#use_binstubs = 0

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
let g:airline_extensions = ['quickfix', 'tabline', 'ale']
let g:airline_theme='base16'
