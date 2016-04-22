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
