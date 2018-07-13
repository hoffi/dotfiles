function hulk::fst; set_color -o green; end
function hulk::snd; set_color -o normal; end
function hulk::trd; set_color -o blue; end
function hulk::dim; set_color -o normal; end
function hulk::err; set_color -o red; end
function off; set_color normal; end

function fish_prompt
  set -l code $status
  function hulk::status::color -S
    test $code -ne 0; and hulk::err; or hulk::snd
  end
  printf (hulk::dim)(date +%H(hulk::status::color):(hulk::dim)%M)(off)
  printf (hulk::status::color)" ≡ "(off)
end
