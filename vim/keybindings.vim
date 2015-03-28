" ----- Custom keybindings ----------------------------------------------------
" Make navigating long, wrapped lines behave like normal lines
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
noremap <silent> _ g_

" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$

" Map <leader>w to save
nnoremap <leader>w :w<CR>

" ---------- Run RSpec ------------
nmap <leader>s :Dispatch zeus rspec %<CR>
function! RspecCurrentLine()
  execute ":Dispatch zeus rspec %:" . line('.')
endfunction
nmap <leader>sl :call RspecCurrentLine()<CR>

" remap jj to escape for easier times
inoremap jj <ESC>

" remap 0 to first non-empty character
map 0 ^

" Re-enable tmux_navigator.vim default bindings
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Create splits
nmap vv :vnew<CR>
nmap ss :new<CR>

"Move back and forth through previous and next buffers with ,z and ,x
nnoremap <silent> <leader>h :bp<CR>
nnoremap <silent> <leader>l :bn<CR>

" Use // to clear hlsearch
map // :nohlsearch<CR>

nmap Q :bd<CR>

" VimDev
nmap <leader>vr :so ~/.vimrc<CR>

