" PLUGIN SETTINGS
" ------ vimux -------
let VimuxUseNearest = 1
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
  autocmd! BufWritePost * Neomake
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
let s:ag_opts = '-i --follow --hidden --column --depth 30 --nocolor --nogroup '.
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

" CtrlP
" ignore space key in CtrlP
let g:ctrlp_abbrev = {
    \ 'gmode': 'itk',
    \ 'abbrevs': [
        \ {
        \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
        \ 'expanded': '',
        \ 'mode': 'pfrz',
        \ },
        \ ]
    \ }

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = ' f'
let g:ctrlp_user_command = 'ag %s ' . s:ag_opts . ' -g ""'
let g:ctrlp_match_func = {'match': 'matcher#cmatch'}
let g:ctrlp_use_caching = 1

" ----- Ag settings -----
let g:agprg="ag " . s:ag_opts
nmap <leader>g :Ag! ""<left>
nnoremap K :Ag! "<C-R><C-W>"<CR>

" ---- vim-vroom settings ----
let g:vroom_use_dispatch = 1 " Run Rspec with vim-dispatch plugin
let g:vroom_use_zeus = 1 " Always use zeus when it is running!

