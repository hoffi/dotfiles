" PLUGIN SETTINGS
" ------ startify -------
let g:startify_session_autoload = 0
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_list_order = ['bookmarks', 'dir', 'files']
autocmd User Startified setlocal cursorline
let g:ctrlp_reuse_window = 'startify'
hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

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
    \ '--ignore "apps/*/cache/*" '.
    \ '--ignore "apps/*/logs/*" '.
    \ '--ignore "cache" '.
    \ '--ignore "logs" '.
    \ '--ignore "log" '.
    \ '--ignore "*.sock" '.
    \ '--ignore "tmp" '.
    \ '--ignore "spec/fixtures/vcr_cassettes/**/*" '.
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
        \ 'mode': '',
        \ },
        \ ]
    \ }

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ar'
let g:ctrlp_user_command = 'ag %s ' . s:ag_opts . ' -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_follow_symlinks = 1

" ----- Ag settings -----
let g:agprg="ag " . s:ag_opts
function! s:SearchCurrentWord(word)
  :Ag l:word
endfunction
nmap <leader>g :LAg! ""<left>
nnoremap K :LAg! "<C-R><C-W>"<CR>

" ----- Shougo/vimfiler settings -----
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

let g:vimfiler_readonly_file_icon = "⭤"
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_tree_opened_icon = "▼"
let g:vimfiler_tree_closed_icon = "▷"

noremap <silent> <leader>f :VimFilerExplorer -split -simple -winwidth=35 -find -buffer-name=split -direction=botright<CR>
noremap <silent> <leader>ff :VimFiler -toggle -invisible -parent -buffer-name=normal<CR>

" Remap mark line to x instead of Space
autocmd FileType vimfiler call s:vimfiler_settings()
function! s:vimfiler_settings()
  silent! nunmap <buffer> <Space>
  nmap <silent><buffer> x <Plug>(vimfiler_toggle_mark_current_line)
endfunction

" ---- vim-tmux-navigator settings ----
" Don't allow any default key-mappings.
let g:tmux_navigator_no_mappings = 1

" ---- vim-vroom settings ----
let g:vroom_map_keys = 0 " Don't map default keybindings
let g:vroom_use_dispatch = 1 " Run Rspec with vim-dispatch plugin
let g:vroom_use_zeus = 1 " Always use zeus when it is running!

