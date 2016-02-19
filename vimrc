set nocompatible
call plug#begin('~/.dotfiles/vim/plugged')
Plug 'rstacruz/vim-opinion'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'
Plug 'skalnik/vim-vroom', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-endwise' " Puts end for if, for, do, def, etc...
Plug 'tpope/vim-surround' " cs[{
Plug 'tomtom/tcomment_vim' " gcc command to comment out code
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'Raimondi/delimitMate' " Automatic closing of brackets, quotes, ...
Plug 'benmills/vimux'
Plug 'benekastah/neomake'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'svenwin/vim-splitted-nerdtree'
call plug#end()

if has('nvim')
  let g:loaded_python_provider = 1
endif

let g:mapleader=" "
set encoding=utf-8
set ffs=unix,mac,dos
set cc=81
set textwidth=80

autocmd BufWritePre * silent! :%s/\s\+$//e " i dont like trailing whitespaces

" --- Abbreviations ----
autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example
autocmd FileType ruby iab <buffer> screenshot! page.save_screenshot 'test.png', full: true
autocmd FileType javascript inoremap <buffer> ƒ function() {<CR>}<up><end><left><left><left>

set t_Co=256
set background=dark
colorscheme gruvbox
let g:airline_theme = 'gruvbox'

" I don't want c to copy anything..
noremap <silent> c "_c

noremap <silent> Y y$
nnoremap <leader>w :w<CR>
map 0 ^
nmap vv :vnew<CR>
nmap ss :new<CR>
nnoremap <silent> <leader>h :bp<CR>
nnoremap <silent> <leader>l :bn<CR>
map // :nohlsearch<CR>
nmap Q :bdelete<CR>
nmap QQ :bdelete!<CR>
vnoremap < <gv
vnoremap > >gv
nmap <leader>n :call splittednerdtree#revealFile()<CR>

" ------ vimux -------
" Prompt for a command to run in a tmux pane
nmap <Leader>tc :wa<CR>:call OpenVimuxPrompt('v', '15')<CR>
nmap <Leader>tvc :wa<CR>:call OpenVimuxPrompt('h', '40')<CR>
function! OpenVimuxPrompt(orientation, size)
  let g:VimuxOrientation=a:orientation
  let g:VimuxHeight=a:size
  execute 'VimuxPromptCommand'
endfunction

" Run last command executed by RunVimTmuxCommand
nmap <Leader>tr :wa<CR>:VimuxRunLastCommand<CR>

" Inspect runner pane
nmap <Leader>ti :VimuxInspectRunner<CR>

" Close all other tmux panes in current window
nmap <Leader>tx :VimuxCloseRunner<CR>

" Zoom runner pane
nmap <Leader>tz :VimuxZoomRunner<CR>

" ------ syntastic and neomake -------
if has('nvim')
  autocmd! BufWritePost *.rb Neomake
endif

" LimeLight
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

" FZF
nnoremap <silent><leader>f :FZF<CR>
nnoremap <silent><leader>b :Buffers<CR>
nnoremap <silent><leader>c :Colors<CR>

" ---- vim-vroom settings ----
let g:vroom_use_vimux = 1
let g:vroom_use_bundle_exec = 1
let g:vroom_use_zeus = 1 " Always use zeus when it is running!

" ---- airline ----
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep =''
