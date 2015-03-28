#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [[ $(uname) == "Darwin" ]]; then
  alias vim="mvim -v"
fi

# Aliases
alias cl="clear"
alias rm='nocorrect rm' # No prompt on deleting
alias git='noglob git'

# https://github.com/Nix-wie-weg/zsh-functions-and-aliases
browse() { open $(eval ${1}) }

alias branch_current='git rev-parse --abbrev-ref HEAD'
alias branch_oldest_ancestor='/usr/bin/diff -u <(git rev-list --first-parent master) <(git rev-list --first-parent HEAD) | sed -ne "s/^ //p" | head -1'
alias branch_log='git log $(branch_oldest_ancestor)..HEAD'
alias branch_diff='git diff $(branch_oldest_ancestor)..HEAD'
alias branch_files='git diff $(branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'
alias bitbucket_repo_url='echo https://$(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git$//")'
alias bitbucket_review_url='echo $(bitbucket_repo_url)/branches/compare/$(branch_current)..$(branch_oldest_ancestor)'
alias redmine_url='echo http://redmine.nwwo.de/issues/$(branch_current | grep -oh "^[0-9]\+")'
alias branch_rubocop="branch_files | grep '\.rb$' | xargs rubocop"
alias bbb='browse bitbucket_repo_url'
alias bbbr='browse bitbucket_review_url'
alias bred='browse redmine_url'
