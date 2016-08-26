set fish_key_bindings fish_vi_key_bindings
set -x EDITOR nvim
set fish_user_paths "/usr/local/bin"

set fish_user_abbreviations
function abbr_add; set fish_user_abbreviations $fish_user_abbreviations $argv; end
abbr_add "cl=clear"
abbr_add "eixt=exit"
abbr_add "rbb=bundle"
abbr_add "rbbe=bundle exec"
abbr_add "rbbi=bundle install --path vendor/bundle"

for file in (ls ~/.dotfiles/fish)
  source ~/.dotfiles/fish/$file
end

set LANG de_DE.UTF-8

if test -e ~/.local.fish
  source ~/.local.fish
end
