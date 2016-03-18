set --erase fish_greeting

set -U EDITOR nvim
set -U fish_user_paths "/usr/local/bin"

set -x GREP_OPTIONS "--color=auto"
set -x NVIM_TUI_ENABLE_CURSOR_SHAPE "1"
set -x NVIM_TUI_ENABLE_TRUE_COLOR "1"
set -x FZF_DEFAULT_OPTS "--color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229 --color info:150,prompt:110,spinner:150,pointer:167,marker:174"

set -U fish_user_abbreviations
function abbr_add; set -U fish_user_abbreviations $fish_user_abbreviations $argv; end
abbr_add "cl=clear"
abbr_add "eixt=exit"
abbr_add "reload=source ~/.config/fish/config.fish"
abbr_add "rbb=bundle"
abbr_add "rbbe=bundle exec"
abbr_add "rbbi=bundle install --path vendor/bundle"
