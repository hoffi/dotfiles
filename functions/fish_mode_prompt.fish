function fish_mode_prompt --description 'Displays the current mode'
  # Do nothing if not in vi mode
  switch $fish_bind_mode
    case default
      set_color --bold --background red black
      echo '[N]'
    case insert
      set_color --bold --background yellow black
      echo '[I]'
    case visual
      set_color --bold --background magenta black
      echo '[V]'
  end
  set_color normal
  echo -n ' '
end
