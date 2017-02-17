function __postexec --on-event fish_postexec
  if command echo $argv | grep '^git checkout' >/dev/null 2>&1
    __set_tcm_abbr
  end
end

function __set_tcm_abbr --on-variable PWD
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set ticket (branch_current | grep -Eo '^\d+')
    if test (count $ticket) -gt 0
      set base_command "git commit --message \"#"
      set new_command $base_command$ticket":"
      abbr -a tcm $new_command
    end
  end
end

__set_tcm_abbr
