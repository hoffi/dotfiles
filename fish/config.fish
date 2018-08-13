set SPACEFISH_PACKAGE_SHOW false
set fish_operator " "

if status --is-interactive
  set -g fish_user_abbreviations
  # Common Abbreviations
  abbr --add cl 'clear'
  abbr --add claer 'clear'
  
  # Git Abbreviations
  abbr --add gb 'git branch'
  abbr --add gbc 'git checkout -b'
  abbr --add gbl 'git branch -v'
  abbr --add gbx 'git branch -d'
  abbr --add gbX 'git branch -D'
  abbr --add gc 'git commit --verbose'
  abbr --add gcm 'git commit --message'
  abbr --add gco 'git checkout'
  abbr --add gf 'git fetch'
  abbr --add gfc 'git clone'
  abbr --add gfr 'git pull --rebase'
  abbr --add gia 'git add'
  abbr --add giA 'git add --patch'
  abbr --add gid 'git diff --no-ext-diff --cached'
  abbr --add gir 'git reset'
  abbr --add gix 'git rm -r --cached'
  abbr --add gl 'git log --format="%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
  abbr --add gls 'git log --stat'
  abbr --add glp 'git log -p'
  abbr --add gm 'git merge'
  abbr --add gmF 'git merge --no-ff'
  abbr --add gma 'git merge --abort'
  abbr --add gmt 'git mergetool'
  abbr --add gp 'git push'
  abbr --add gpc 'git push --set-upstream origin (branch_current 2> /dev/null)'
  abbr --add gr 'git rebase'
  abbr --add gs 'git stash'
  abbr --add gsp 'git stash pop'
  abbr --add gws 'git status --short'
  abbr --add gwd 'git diff --no-ext-diff'
  abbr --add gwx 'git rm -r'
  abbr --add gwX 'git rm -rf'

  # https://github.com/Nix-wie-weg/zsh-functions-and-aliases
  alias branch_oldest_ancestor='/usr/bin/diff -u (git rev-list --first-parent master | psub) (git rev-list --first-parent HEAD | psub) | sed -ne "s/^ //p" | head -1'
  alias branch_log='git log (branch_oldest_ancestor)..HEAD'
  alias branch_diff='git diff (branch_oldest_ancestor)..HEAD'
  alias branch_files='git diff (branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'
  alias bitbucket_repo_url='echo https://(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git\$//")'
  alias bitbucket_review_url='echo (bitbucket_repo_url)/branches/compare/(branch_current)..(branch_oldest_ancestor)'
  alias redmine_url='echo http://redmine.nwwo.de/issues/(branch_current | grep -oh "^[0-9]\+")'
  alias branch_rubocop="branch_files | grep '\.\(rb\|gemspec\)\$' | xargs bundle exec rubocop --force-exclusion"
end
