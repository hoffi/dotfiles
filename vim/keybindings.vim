" ----- Custom keybindings ----------------------------------------------------
" use 'Y' to yank to the end of a line, instead of the whole line
noremap <silent> Y y$

" Map <leader>w to save
nnoremap <leader>w :w<CR>

" remap 0 to first non-empty character
map 0 ^

" Create splits
nmap vv :vnew<CR>
nmap ss :new<CR>

"Move back and forth through previous and next buffers with h and l
nnoremap <silent> <leader>h :bp<CR>
nnoremap <silent> <leader>l :bn<CR>

" Use // to clear hlsearch
map // :nohlsearch<CR>

" Close buffer
nmap Q :bdelete<CR>
nmap QQ :bdelete!<CR>

" Keep selection after indenting
vnoremap < <gv
vnoremap > >gv

nmap <leader>n :call splittednerdtree#revealFile()<CR>
