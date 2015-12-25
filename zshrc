autoload -U colors && colors

if [ "$(uname -s)" = "Darwin" ]; then
  source "$(brew --prefix)/share/antibody.zsh"
  alias ls='ls -G'
else
  source "$HOME/.dotfiles/antibody.zsh"
  alias ls='ls -G --color=auto'
fi
antibody bundle < "$HOME/.dotfiles/zsh_bundles.txt"

bindkey -v
setopt auto_cd
setopt nobeep
export KEYTIMEOUT=10
alias cl="clear"

# Ruby Aliases
alias rbb='bundle'
alias rbbe='bundle exec'
alias rbbi='bundle install --path vendor/bundle'

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

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

if [[ -s "${ZDOTDIR:-$HOME}/.zshrc.after" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc.after"
fi

if [[ ! (-s "${ZDOTDIR:-$HOME}/.dircolors") ]]; then
  wget -q -T 5 https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O "${ZDOTDIR:-$HOME}/.dircolors"
fi

if [ "$(uname -s)" = "Darwin" ]; then
  eval $(gdircolors -b $HOME/.dircolors)
else
  eval $(dircolors -b $HOME/.dircolors)
fi
