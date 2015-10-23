set nocompatible

call plug#begin('~/.dotfiles/vim/plugged')

""" General
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'

""" Appearance
Plug 'sjl/badwolf'
Plug 'sheerun/vim-polyglot'
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
if !has('nvim')
  Plug 'scrooloose/syntastic'
endif
Plug 'szw/vim-ctrlspace'
Plug 'rking/ag.vim'
Plug 'jreybert/vimagit'
Plug 'scrooloose/nerdtree'
Plug 'svenwin/vim-splitted-nerdtree'

call plug#end()

let g:mapleader=" "
set number             " line numbers
set linebreak          " wrap lines on 'word' boundaries
set splitright         " Vertical splits use right half of screen
set timeout
set timeoutlen=300     " Lower ^[ timeout
set ttyfast            " Assume fast terminal
set gdefault           " automatically overwrite all instances on s//
set hidden
set noswapfile nobackup nowb nospell
set lazyredraw         " No redraw while in macros
set magic              " Turn magic on for regex
set breakindent        " Indent wrapped lines up to the same level
set nowrap
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set encoding=utf-8
set ffs=unix,mac,dos

" Tab settings
set expandtab          " Expand tabs into spaces
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line
autocmd BufWritePre * silent! :%s/\s\+$//e " i dont like trailing whitespaces

" Textwidth
set cc=81
set textwidth=80

" --- Abbreviations ----
iab pry! require 'pry'; binding.pry
iab css! page.save_screenshot 'test.png', full: true
iab vcr! VCR.record_this_example

syntax on
set hlsearch
set t_Co=256

set background=dark
colorscheme badwolf
let g:airline_theme = 'badwolf'

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

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

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" ag Options
let s:ag_opts = '-i --follow --hidden --column --depth 10 --nocolor --nogroup '.
    \ '--ignore "bower_modules" '.
    \ '--ignore "node_modules" '.
    \ '--ignore "cache" '.
    \ '--ignore "logs" '.
    \ '--ignore "log" '.
    \ '--ignore "*.sock" '.
    \ '--ignore "tmp" '.
    \ '--ignore "spec/fixtures/vcr_cassettes" '.
    \ '--ignore ".git" '.
    \ '--ignore "*.ttf" '.
    \ '--ignore "*.png" '.
    \ '--ignore "*.jpg" '.
    \ '--ignore ".DS_Store" '.
    \ '--ignore "*.gif"'

" CtrlSpace
nnoremap <silent><leader>f :CtrlSpace O<CR>
let g:CtrlSpaceGlobCommand = 'ag ' . s:ag_opts . ' -g ""'
let g:CtrlSpaceSearchTiming = 0

" ----- Ag settings -----
let g:ag_prg="ag " . s:ag_opts
nmap <leader>g :Ag! ""<left>
nnoremap K :Ag! "<C-R><C-W>"<CR>

" ---- vim-vroom settings ----
let g:vroom_use_vimux = 1
let g:vroom_use_bundle_exec = 1
let g:vroom_use_zeus = 1 " Always use zeus when it is running!

" ---- airline ----
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ''
let g:airline_right_sep =''
