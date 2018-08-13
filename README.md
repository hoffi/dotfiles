# Stefan's dotfiles

## Installation
Clone the repo and run the install script:

Fish:
```fish
git clone git@github.com:hoffi/dotfiles.git ~/.dotfiles; and cd ~/.dotfiles; and make
```

To update simply `cd` into the `.dotfiles` directory and `git pull`.
If new files were added to the repo simply run `make` again and it will setup
everything correctly

## Configure git user
To configure the git user create a file `.gitconfig.user` in your HOME directory
and add your user infos:
```
[user]
name = NAME
email = EMAIL
```
