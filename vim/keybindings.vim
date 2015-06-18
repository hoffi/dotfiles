" ----- Custom keybindings ----------------------------------------------------
" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$

" Map <leader>w to save
nnoremap <leader>w :w<CR>

" ---------- Run RSpec ------------
nmap <leader>s :VroomRunTestFile<CR>
nmap <leader>sl :VroomRunNearestTest<CR>
nmap <leader>sr :VroomRunLastTest<CR>

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

"Move back and forth through previous and next buffers with h and l
nnoremap <silent> <leader>h :bp<CR>
nnoremap <silent> <leader>l :bn<CR>

" Use // to clear hlsearch
map // :nohlsearch<CR>

" Close buffer
nmap Q :bd<CR>

" VimDev
nmap <leader>vr :so ~/.vimrc<CR>

" Keep selection after indenting
vnoremap < <gv
vnoremap > >gv
