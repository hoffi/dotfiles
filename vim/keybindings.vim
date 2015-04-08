" ----- Custom keybindings ----------------------------------------------------
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
function! JumpOverQuickfix(cmd)
  execute a:cmd
  if &buftype ==# 'quickfix'
    execute a:cmd
  endif
endfunction
nnoremap <silent> <leader>h :call JumpOverQuickfix(":bp")<CR>
nnoremap <silent> <leader>l :call JumpOverQuickfix(":bn")<CR>

" Use // to clear hlsearch
map // :nohlsearch<CR>

nmap Q :bd<CR>

" VimDev
nmap <leader>vr :so ~/.vimrc<CR>

vnoremap < <gv
vnoremap > >gv
