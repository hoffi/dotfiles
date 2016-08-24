set fish_color_normal 5f5f5f
set fish_color_command 5f87ff
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_end bcbcbc
set fish_color_error red --bold
set fish_color_param 5f87ff
set fish_color_comment red
set fish_color_match cyan
set fish_color_search_match --background=purple
set fish_color_operator cyan
set fish_color_escape cyan
set fish_color_cwd 00875f
set fish_pager_color_prefix cyan
set fish_pager_color_completion normal
set fish_pager_color_description 555 yellow
set fish_pager_color_progress cyan
set fish_pager_color_secondary

set fish_color_host cyan
set fish_color_user cyan

function hulk::fst; set_color -o 90f; end
function hulk::snd; set_color -o cF3; end
function hulk::trd; set_color -o fff; end
function hulk::dim; set_color -o 555; end
function hulk::err; set_color -o f30; end
function off; set_color normal; end

function fish_prompt
  set -l code $status
  function hulk::status::color -S
    test $code -ne 0; and hulk::err; or hulk::snd
  end
  printf (hulk::dim)(date +%H(hulk::status::color):(hulk::dim)%M)(off)
  printf (hulk::status::color)" ≡ "(off)
end
