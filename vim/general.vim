" ######### GENERAL SETTINGS #############
"
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set number             " line numbers
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=2        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical splits use right half of screen
set timeout
set timeoutlen=300     " Lower ^[ timeout
set ttimeoutlen=100
set laststatus=2
set ttyfast            " Assume fast terminal
set gdefault           " automatically overwrite all instances on s//
set hidden
set noswapfile nobackup nowb nospell
set lazyredraw         " No redraw while in macros
set magic              " Turn magic on for regex
set synmaxcol=200      " Don't syntax highlight long lines
set shortmess=aoOT     " Short messages
set t_ut=              " No Background Redraw. (fixes broken background in tmux)
set autoread           " Auto reload changed files
if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
  set wrap
endif

set encoding=utf-8
set ffs=unix,mac,dos

let g:mapleader=" "

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
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Textwidth
set cc=81
set textwidth=80

" --- Abbreviations ----
iab pry! require 'pry'; binding.pry
iab css! page.save_screenshot 'test.png', full: true
iab vcr! VCR.record_this_example

" ----- Terminal-as-GUI settings ----------------------------------------------
" In many terminal emulators the mouse works just fine, thus enable it.
" But i don't want the mouse wheel
if has('mouse')
  set mouse=a
endif

syntax on
set hlsearch
set t_Co=256
