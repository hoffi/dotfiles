source ~/.zplug/zplug

zplug "mafredri/zsh-async", nice:13
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions", nice:11
zplug "zsh-users/zsh-history-substring-search", nice:12
zplug "hoffi/zsh-theme-lambda"
zplug "hoffi/zsh-git-aliases", if:"which git"
zplug "sharat87/zsh-vim-mode"
zplug "willghatch/zsh-saneopt"
zplug "johnhamelink/rvm-zsh", if:"which rvm"
zplug "djui/alias-tips", nice:11
zplug "caarlos0/zsh-mkc"
zplug "Tarrasch/zsh-autoenv", nice:14
zplug "rimraf/k", nice:15
zplug "trapd00r/LS_COLORS", of:"LS_COLORS", as:command, nice:16
zplug "~/.zsh", from:local, nice:17, file:"*.zsh"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
