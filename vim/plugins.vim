" PLUGIN SETTINGS
" ------ watchdogs -------
" let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enables = {
  \ "ruby" : 1,
  \ "javascript" : 1
  \ }
"
let g:quickrun_config = {}
let g:quickrun_config["watchdogs_checker/rubocop_2"] = {
  \ "command"   : "rubocop",
  \ "exec"      : "%c %o -f e %s:p ",
  \ "quickfix/errorformat" : "%f:%l:%c: C: %m",
  \}

let g:quickrun_config["ruby/watchdogs_checker"] = {
  \ "type" : "watchdogs_checker/rubocop_2",
  \ "runner/vimproc/updatetime" : 50
  \}
let g:quickrun_config["javascript/watchdogs_checker"] = {
  \ "type" : "watchdogs_checker/jshint",
  \ "runner/vimproc/updatetime" : 10
  \}
let g:quickrun_config["watchdogs_checker/_"] = {
  \ "hook/close_quickfix/enable_exit" : 1
  \ }

call watchdogs#setup(g:quickrun_config)

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
    \ '--ignore "*.ttf" '.
    \ '--ignore "*.png" '.
    \ '--ignore "*.jpg" '.
    \ '--ignore "*.gif"'

" CtrlP
let g:ctrlp_map = 'ff'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ar'
let g:ctrlp_user_command = 'ag %s ' . s:ag_opts . ' -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_func = {'match': 'matcher#cmatch'}

nnoremap <silent> fr   :<C-u>UniteResume -no-start-insert -force-redraw<CR>
nnoremap <silent> fg   :<C-u>Unite grep:. -no-wrap<CR>
nnoremap <silent> fe   :<C-u>Unite register<CR>
nnoremap <silent> fh   :<C-u>Unite history/yank<CR>
nnoremap <silent> fma  :<C-u>Unite mapping -silent<CR>
nnoremap <silent> <Leader>b  :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>ta :<C-u>Unite tab<CR>
" Open Unite with word under cursor or selection
nnoremap <silent> K :UniteWithCursorWord grep:. -no-wrap<CR>

" ----- Shougo/vimfiler settings -----
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

let g:vimfiler_readonly_file_icon = "⭤"
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_tree_opened_icon = "▼"
let g:vimfiler_tree_closed_icon = "▷"

noremap <silent> <leader>f :VimFilerExplorer -split -simple -winwidth=35 -find -buffer-name=split -direction=botright<CR>
noremap <silent> <leader>p :VimFiler -toggle -invisible -parent -buffer-name=normal<CR>

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

