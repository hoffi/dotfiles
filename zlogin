{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
