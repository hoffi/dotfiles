let mapleader=" "

" Common Keybindings
map 0 ^
map <leader>w :w<CR>
map <silent> <C-P> :bp<CR>
map <silent> <C-N> :bn<CR>
map // :nohlsearch<CR>
vnoremap < <gv
vnoremap > >gv

" Plugin Keybindings
nmap - :NERDTreeFind<CR>
nmap Q :Sayonara<CR>
nnoremap <leader>f :FuzzyOpen<CR>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
