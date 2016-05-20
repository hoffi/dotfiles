set nocompatible
call plug#begin('~/.dotfiles/vim/plugged')
Plug 'rstacruz/vim-opinion'
Plug 'christophermca/meta5'
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-dirvish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'rhysd/clever-f.vim'
Plug 'benekastah/neomake'
Plug 'skalnik/vim-vroom', { 'for': 'ruby' } | Plug 'benmills/vimux', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' } " Puts end for if, for, do, def, etc...
Plug 'tomtom/tcomment_vim' " gcc command to comment out code
Plug 'Raimondi/delimitMate' " Automatic closing of brackets, quotes, ...
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

let g:ctrlp_map = '<leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
" ignore space key in CtrlP
let g:ctrlp_abbrev = {
    \ 'gmode': 'i',
    \ 'abbrevs': [
			\ {
			\ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
			\ 'expanded': '',
			\ 'mode': 'pfrz',
			\ },
			\ ]
    \ }

if executable('ag')
	" ag is so fast
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore ".git" --hidden -i'
	let g:ctrlp_lazy_update = 30
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap K :Ag <C-R><C-W><CR>
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif


if has('nvim')
  let g:loaded_python_provider = 1
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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
set timeoutlen=500
set ttimeoutlen=500

autocmd BufWritePre * silent! :%s/\s\+$//e " i dont like trailing whitespaces

" --- Abbreviations ----
autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example
autocmd FileType ruby iab <buffer> screenshot! page.save_screenshot 'test.png', full: true

set t_Co=256
set background=dark
colorscheme meta5
let g:airline_theme = 'dark'
let g:airline_extensions = ['tabline', 'quickfix', 'ctrlp']

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

" ------ syntastic and neomake -------
if has('nvim')
  autocmd! BufWritePost *.rb,*.js Neomake
endif
let g:neomake_javascript_enabled_makers = ['eslint']

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

" ---- dirvish ----
function DirvishCommand(command)
  call system(a:command)
  :Dirvish %
endfunction
au FileType dirvish map <buffer> D :call DirvishCommand("rm -rf <c-r><c-a>")
au FileType dirvish map <buffer> d :call DirvishCommand("mkdir ".expand("%")."")<left><left>
au FileType dirvish map <buffer> R :call DirvishCommand("mv <c-r><c-a> <c-r><c-a>")<left><left>
au FileType dirvish map <buffer> % :e %

if &shell =~# 'fish$'
  set shell=sh
endif
