set --erase fish_greeting

set -U EDITOR nvim
set -U fish_user_abbreviations
set -U fish_user_paths "/usr/local/bin"
set -x GREP_OPTIONS "--color=auto"

function abbr_add; set -U fish_user_abbreviations $fish_user_abbreviations $argv; end
abbr_add "cl=clear"
abbr_add "eixt=exit"
abbr_add "reload=source ~/.config/fish/config.fish"
abbr_add "rbb=bundle"
abbr_add "rbbe=bundle exec"
abbr_add "rbbi=bundle install --path vendor/bundle"

for file in (ls ~/.dotfiles/fish)
  source ~/.dotfiles/fish/$file
end

set fish_color_autosuggestion 969896
set fish_color_command b294bb
set fish_color_comment f0c674
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end b294bb
set fish_color_error cc6666
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host cyan
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param 81a2be
set fish_color_quote b5bd68
set fish_color_redirection 8abeb7
set fish_color_search_match --background=red
set fish_color_selection --background=green
set fish_color_status red
set fish_color_user blue
set fish_color_valid_path --underline
set fish_pager_color_completion normal
set fish_pager_color_description '555'  'yellow'
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

if test -e ~/.local.fish
  source ~/.local.fish
end
