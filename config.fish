set -g fish_user_paths "/usr/local/bin" $fish_user_paths
set LANG de_DE.UTF-8
set -x EDITOR nvim
set -x GIT_EDITOR nvim

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

if test -e ~/.local.fish
  source ~/.local.fish
end
