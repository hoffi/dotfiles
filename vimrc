set nocompatible

call plug#begin('~/.dotfiles/vim/plugged')

""" General
Plug 'rstacruz/vim-opinion'
Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'

""" Appearance
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } | Plug 'junegunn/limelight.vim'

""" Ruby specific
Plug 'skalnik/vim-vroom', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-endwise' " Puts end for if, for, do, def, etc...

""" Editing
Plug 'tpope/vim-surround' " cs[{
Plug 'tomtom/tcomment_vim' " gcc command to comment out code
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'Raimondi/delimitMate' " Automatic closing of brackets, quotes, ...
Plug 'benmills/vimux'

""" Project
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
set linebreak          " wrap lines on 'word' boundaries
set timeout
set timeoutlen=300     " Lower ^[ timeout
set gdefault           " automatically overwrite all instances on s//
set magic              " Turn magic on for regex
set encoding=utf-8
set ffs=unix,mac,dos

autocmd BufWritePre * silent! :%s/\s\+$//e " i dont like trailing whitespaces

" Textwidth
set cc=81
set textwidth=80

" --- Abbreviations ----
iab pry! require 'pry'; binding.pry
iab css! page.save_screenshot 'test.png', full: true
iab vcr! VCR.record_this_example

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

nmap <Leader>gcm :Gcommit<CR>
nmap <Leader>gia :Gwrite<CR>
nmap <Leader>gp :Gpush<CR>

nmap <Leader>gws :new<CR>:set filetype=diff<CR>:r ! git status --short<CR>
nmap <Leader>gwd :new<CR>:set filetype=diff<CR>:r ! git diff<CR>
nmap <Leader>gid :new<CR>:set filetype=diff<CR>:r ! git diff --cached<CR>

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
else
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
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
