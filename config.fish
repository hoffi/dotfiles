set -g fish_key_bindings fish_default_key_bindings
set -x EDITOR nvim
set fish_user_paths "/usr/local/bin"

if not set -q abbrs_initialized
  set -U abbrs_initialized
  abbr cl 'clear'
  abbr eixt 'exit'
  abbr rbb 'bundle'
  abbr rbbe 'bundle exec'
  abbr rbbi 'bundle install --jobs 4 --path vendor/bundle'
end

for file in (ls ~/.dotfiles/fish)
  source ~/.dotfiles/fish/$file
end

set LANG de_DE.UTF-8

if test -e ~/.local.fish
  source ~/.local.fish
end
