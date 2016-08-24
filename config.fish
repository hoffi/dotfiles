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

if test -e ~/.local.fish
  source ~/.local.fish
end

# TODO: WIP
# function __set_fish_abbr --on-variable PWD
#   if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
#     set new_command "git commit --message \"#"(branch_current)":"
#     set new_ab (string replace -r 'tcm=git commit --message \"#.*:' "tcm=$new_command" $fish_user_abbreviations)
#     set -U fish_user_abbreviations $new_ab
#   end
# end
# __set_fish_abbr
