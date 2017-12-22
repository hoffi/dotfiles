FROM alpine:latest

RUN apk --no-cache add --update build-base fish tmux neovim less curl wget the_silver_searcher git
ADD . /root/.dotfiles
RUN cd ~/.dotfiles && make && nvim --headless +PlugInstall +UpdateRemotePlugins +qall || true && mkdir /usr/src
ENV TERM=xterm-256color
WORKDIR /usr/src

CMD ["tmux", "-u2"]
