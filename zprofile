if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  ~/.dotfiles/bin/mux
  $path
)

export GREP_COLOR='1;33'
export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Better History
HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
HISTSIZE=10000
SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY

# Autocorrect
setopt CORRECT

# Theme
function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%B%F{196}(ssh) %{$fg_bold[white]%}%n@%2m:"
  fi
}

git_prompt_info() {
  echo $(git rev-parse --abbrev-ref HEAD)
}

function git_status() {
  git_status=$(git status --porcelain -unormal)
  output=""
  if $(echo "$git_status" | grep '^UU ' &> /dev/null); then
    output="$output%{$fg[blue]%}°"
  fi
  if $(echo "$git_status" | grep -E '^(.M|R.|C.|.T) ' &> /dev/null); then
    output="$output%{$fg[yellow]%}!"
  fi
  if $(echo "$git_status" | grep '^A. ' &> /dev/null); then
    output="$output%{$fg[green]%}+"
  fi
  if $(echo "$git_status" | grep -E '^(D.|.D) ' &> /dev/null); then
    output="$output%{$fg[red]%}-"
  fi
  if $(echo "$git_status" | grep '^?? ' &> /dev/null); then
    output="$output%{$fg[white]%}*"
  fi
  echo $output
}

function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  if [ ! -z $git_status ]
     then
     git_status=" $git_status"
  fi
  echo "%{$fg[white]%}‹%B%F{136} $(git_prompt_info)$(git_status) %{$fg[white]%}›"
}

lambda() {
  echo "%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})λ"
}

PROMPT=$'$(ssh_connection)%B%F{245}%~ $(my_git_prompt) \n$(lambda) %{$reset_color%}'
