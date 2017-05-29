DOTFILES := $(shell pwd)
LN_FLAGS = -sfn

all: setup_shell setup_git setup_tmux setup_vim setup_ruby

setup_shell:
	mkdir -p ${HOME}/.config/fish/
	ln $(LN_FLAGS) $(DOTFILES)/config.fish ${HOME}/.config/fish/config.fish
	ln $(LN_FLAGS) $(DOTFILES)/functions ${HOME}/.config/fish/functions
setup_git:
	ln $(LN_FLAGS) $(DOTFILES)/git/config ${HOME}/.gitconfig
	ln $(LN_FLAGS) $(DOTFILES)/git/ignore ${HOME}/.gitignore
setup_tmux:
	ln $(LN_FLAGS) $(DOTFILES)/tmux.conf ${HOME}/.tmux.conf
setup_vim:
	ln $(LN_FLAGS) $(DOTFILES)/vim ${HOME}/.config/nvim
	ln $(LN_FLAGS) $(DOTFILES)/vimrc ${HOME}/.config/nvim/init.vim
setup_ruby:
	ln $(LN_FLAGS) $(DOTFILES)/gemrc ${HOME}/.gemrc
	ln $(LN_FLAGS) $(DOTFILES)/ruby/irbrc ${HOME}/.irbrc
	ln $(LN_FLAGS) $(DOTFILES)/ruby/pryrc ${HOME}/.pryrc
