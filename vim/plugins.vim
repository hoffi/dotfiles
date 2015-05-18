" PLUGIN SETTINGS
" ------ watchdogs -------
" let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_BufWritePost_enables = {
  \ "ruby" : 1
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

" ----- Shougo/unite.vim settings -----
let g:unite_source_history_yank_enable = 1

let s:ag_opts = '-SU -i --hidden --depth 30 --nocolor --nogroup '.
    \ '--ignore ".git" '.
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

let g:unite_source_rec_async_command = 'ag --follow '.s:ag_opts.' -g ""'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--line-numbers '.s:ag_opts
let g:unite_source_grep_recursive_opt = ''

let g:unite_source_rec_unit = 3000
let g:unite_source_rec_min_cache_files = 400
let g:unite_source_rec_max_cache_files = 23000

let g:unite_source_grep_max_candidates = 400

" Unite keybindings
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  let b:SuperTabDisabled=1
  silent! nunmap <buffer> <C-h>
  silent! nunmap <buffer> <C-k>
  silent! nunmap <buffer> <C-l>
  silent! nunmap <buffer> <C-r>
  nmap <silent><buffer> <C-r> <Plug>(unite_redraw)
  imap <silent><buffer> <C-j> <Plug>(unite_select_next_line)
  imap <silent><buffer> <C-k> <Plug>(unite_select_previous_line)
  nmap <buffer> <ESC>              <Plug>(unite_exit)
  imap <buffer> jj                 <Plug>(unite_insert_leave)
  imap <buffer> <Tab>              <Plug>(unite_complete)
  nmap <buffer> <C-z>              <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-z>              <Plug>(unite_toggle_transpose_window)
  imap <buffer> <C-w>              <Plug>(unite_delete_backward_path)
  nnoremap <silent><buffer><expr> r unite#do_action('rename')
endfunction

" Global default context
call unite#custom#profile('default', 'context', {
  \   'safe': 0,
  \   'auto_expand': 1,
  \   'start_insert': 1,
  \   'smartcase': 1,
  \   'max_candidates': 0,
  \   'short_source_names': 1,
  \   'update_time': 500,
  \   'winheight': 15,
  \   'winwidth': 40,
  \   'direction': 'topleft',
  \   'no_auto_resize': 1,
  \   'prompt_direction': 'top',
  \   'candidate_icon': '-',
  \   'marked_icon': '✓',
  \   'prompt' : '⮀ '
  \ })

call unite#custom#profile('action', 'context', {
  \   'start_insert': 1
  \ })

" Conveniently set settings globally per-source
call unite#custom#profile('source/history/yank', 'context', {
  \ 'start_insert': 0
  \ })

call unite#custom#profile('source/giti/status', 'context', {
  \   'start_insert': 0,
  \   'keep_focus': 1,
  \   'no_quit': 1
  \ })

call unite#custom#profile('source/outline', 'context', {
  \   'vertical': 1,
  \   'direction': 'botright',
  \   'no_focus': 1,
  \   'start_insert': 0,
  \   'keep_focus': 1,
  \   'no_quit': 1,
  \ })

call unite#custom#profile('source/grep', 'context', {
  \   'silent': 1,
  \   'vertical_preview': 1,
  \   'start_insert': 0,
  \   'keep_focus': 1,
  \   'no_quit': 1,
  \ })

" Filters
call unite#custom#source(
      \ 'file_rec,file_rec/async,file_rec', 'converters',
      \ ['converter_file_directory'])
call unite#filters#matcher_default#use(['matcher_glob', 'matcher_context'])
call unite#filters#sorter_default#use(['sorter_selecta'])

nnoremap <silent> fr   :<C-u>UniteResume -no-start-insert -force-redraw<CR>
nnoremap <silent> ff   :<C-u>Unite file_rec/async<CR>
nnoremap <silent> fg   :<C-u>Unite grep:. -no-wrap<CR>
nnoremap <silent> fs   :<C-u>Unite giti/status<CR>
nnoremap <silent> fe   :<C-u>Unite register<CR>
nnoremap <silent> fh   :<C-u>Unite history/yank<CR>
nnoremap <silent> fo   :<C-u>Unite outline<CR>
nnoremap <silent> fma  :<C-u>Unite mapping -silent<CR>
nnoremap <silent> <Leader>b  :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>ta :<C-u>Unite tab<CR>
" Open Unite with word under cursor or selection
nnoremap <silent> K :UniteWithCursorWord grep:. -profile-name=navigate<CR>

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

