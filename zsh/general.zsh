autoload -U colors && colors

bindkey -v
setopt auto_cd

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && export FZF_DEFAULT_OPTS='--color=light'

[ -f ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh

if [ "$(uname -s)" = "Darwin" ]; then
  eval $(gdircolors -b $HOME/.zplug/repos/trapd00r/LS_COLORS/LS_COLORS)
  alias ls="ls -G"
else
  eval $(dircolors -b $HOME/.zplug/repos/trapd00r/LS_COLORS/LS_COLORS)
  alias ls="ls -G --color=auto"
fi
