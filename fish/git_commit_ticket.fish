abbr_add tcm='git commit --message "#1:'

function __postexec --on-event fish_postexec
  if command echo $argv | grep '^git checkout' >/dev/null 2>&1
    __set_tcm_abbr
  end
end

function __set_tcm_abbr --on-variable PWD
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set base_command "tcm=git commit --message \"#"
    set ticket (branch_current | grep -Eo '^\d+')
    if test (count $ticket) -gt 0
      set new_command $base_command$ticket":"
      set new_ab (string replace -r "$base_command.*:" $new_command $fish_user_abbreviations)
      set fish_user_abbreviations $new_ab
    end
  end
end

__set_tcm_abbr
