function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  function ssh_connection
    if [ -n "$SSH_CONNECTION" ]
      set_color -ou red
      echo "(ssh)"
      set_color white
      echo -n (whoami)'@'(hostname)':'
      set_color normal
    end
  end

  function git_status
    set -l git_status (command git status --porcelain -b -unormal --ignore-submodules=all | cut -c 1-2)
    if [ (count (echo $git_status | grep 'UU')) -gt 0 ]
      set_color blue
      echo -n '°'
    end
    if [ (count (echo $git_status | grep -E "(M|R|C|T)")) -gt 0 ]
      set_color yellow
      echo -n '!'
    end
    if [ (count (echo $git_status | grep '??')) -gt 0 ]
      set_color white
      echo -n '*'
    end
    if [ (count (echo $git_status | grep 'A')) -gt 0 ]
      set_color green
      echo -n '+'
    end
    if [ (count (echo $git_status | grep 'D')) -gt 0 ]
      set_color red
      echo -n '-'
    end
    if [ (count (echo $git_status | grep '^## .*ahead')) -gt 0 ]
      set_color 156
      echo -n '⬈'
    end
  end

  function my_git_prompt
    set -l tester (git rev-parse --git-dir 2> /dev/null)
    if test -n "$tester"
      set_color -o white
      echo "‹"
      set_color -u 136
      echo -n (branch_current)
      set_color normal
      echo (git_status)
      set_color -o white
      echo "›"
      set_color normal
    end
  end

  function _path
    set_color 245
    echo (pwd)
    set_color normal
  end

  echo (ssh_connection) (_path) (my_git_prompt)

  if [ $last_status -ne 0 ]
    set_color -o red
  else
    set_color -o green
  end
  echo -n 'λ '
  set_color normal

  fzf_key_bindings
  setup_colors
  git_aliases
end
