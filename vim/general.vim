" ######### GENERAL SETTINGS #############
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=500        " keep 500 lines of command line history
set number             " line numbers
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=2        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical splits use right half of screen
set timeout
set timeoutlen=700     " Lower ^[ timeout
set ttimeoutlen=100
set laststatus=2
set noshowmode
set tildeop            " use ~ to toggle case as an operator, not a motion
set ttyfast            " Assume fast terminal
set gdefault           " automatically overwrite all instances on s//
set hidden
set noswapfile nobackup nowb nospell
set lazyredraw         " No redraw while in macros
set magic              " Turn magic on for regex
set synmaxcol=200      " Don't syntax highlight long lines
set diffopt=filler,iwhite
set shortmess=aoOT     " Short messages
set fillchars=vert:\ ,fold:─
set t_ut=              " No Background Redraw. (fixes broken background in tmux)
set autoread           " Auto reload changed files
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
  set wrap
endif

set modelines=0
set encoding=utf-8
set ffs=unix,mac,dos

let g:mapleader=" "
let g:maplocalleader=","
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>

" Tab settings
set expandtab          " Expand tabs into spaces
set smarttab
set autoindent
set smartindent
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line
autocmd BufWritePre * silent! :%s/\s\+$//e " i dont like trailing whitespaces

" ================ Completion =======================
"
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Textwidth and Cursor Line
set cc=81
set textwidth=80
set cursorline

" --- Abbreviations ----
iab pry! require 'pry'; binding.pry
iab css! page.save_screenshot 'test.png', full: true
iab vcr! VCR.record_this_example

" ----- Terminal-as-GUI settings ----------------------------------------------
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  set t_Co=256
endif

" ----- Not-quite-general-but-don't-belong-anywhere-else Settings -------------
augroup vimrc
  " Clear the current autocmd group, in case we're re-sourcing the file
  au!
  " Jump to the last known cursor position when opening a file.
  autocmd BufReadPost
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

" ----- Convenience commands and cabbrev's ------------------------------------

" Make these commonly mistyped commands still work
command! WQ wq
command! Wq wq
command! Wqa wqa
command! W w
command! Q q

" Force write readonly files using sudo
command! WS w !sudo tee %
" open help in a new tab
cabbrev help tab help
