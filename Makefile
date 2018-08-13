DOTFILES := $(shell pwd)
LN_FLAGS = -sf
dein_vim = ${HOME}/.cache/dein

all: setup_config_dir setup_homebrew setup_shell setup_tmux setup_vim setup_ruby setup_git

setup_config_dir:
	mkdir -p ${HOME}/.config
setup_shell:
	mkdir -p ${HOME}/.config/fish/functions
	ln $(LN_FLAGS) $(DOTFILES)/fish/config.fish ${HOME}/.config/fish/config.fish
	ln $(LN_FLAGS) $(DOTFILES)/fish/fishfile ${HOME}/.config/fish/fishfile
	ln $(LN_FLAGS) $(DOTFILES)/fish/functions/* ${HOME}/.config/fish/functions
	fish -ic "fisher"
setup_tmux:
	ln $(LN_FLAGS) $(DOTFILES)/tmux.conf ${HOME}/.tmux.conf
setup_ruby:
	ln $(LN_FLAGS) $(DOTFILES)/gemrc ${HOME}/.gemrc
setup_git:
	ln $(LN_FLAGS) $(DOTFILES)/gitconfig ${HOME}/.gitconfig
	ln $(LN_FLAGS) $(DOTFILES)/gitignore_global ${HOME}/.gitignore_global
setup_vim: | $(dein_vim)
	mkdir -p ${HOME}/.config/nvim
	ln $(LN_FLAGS) $(DOTFILES)/nvim/init.vim ${HOME}/.config/nvim/init.vim
	nvim --headless +qall
setup_homebrew:
	brew tap homebrew/cask
	brew install git cask htop fasd fzy neovim tmux the_silver_searcher
	brew cask install docker iterm2 sequel-pro
	brew tap fisherman/tap
	brew install fisherman

$(dein_vim):
	mkdir -p $@/repos/github.com/Shougo
	git clone https://github.com/Shougo/dein.vim $(dein_vim)/repos/github.com/Shougo/dein.vim

.PHONY: all
