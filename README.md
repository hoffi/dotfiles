# Stefan's dotfiles

![Screenshot of vim and shell prompt](https://raw.githubusercontent.com/hoffi/dotfiles/fish/screenshot.png)

## Installation
Clone the repo and run the install script:
```bash
git clone git@github.com:hoffi/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./install
```

To update simply `cd` into the `.dotfiles` directory and `git pull`.
If new files were added to the repo simply run `./install` again and it will setup
everything correctly

## Configure git user
To configure the git user create a file `.gitconfig.user` in your HOME directory
and add your user infos:
```
[user]
name = NAME
email = EMAIL
```

## Theme

[hoffi/zsh-theme-lambda](https://github.com/hoffi/zsh-theme-lambda)

## Thanks to

* [Anish Athalye](http://www.anishathalye.com) for his [dotbot](https://github.com/anishathalye/dotbot) script
* [Carlos Alexandro Becker](https://github.com/caarlos0) for creating [antibody](https://github.com/caarlos0/antibody)
