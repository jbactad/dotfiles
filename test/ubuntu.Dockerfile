FROM ubuntu

LABEL maintainer="Jim Geoshua Bactad"

RUN apt-get update && \
  apt-get install vim curl git zsh tmux file -y

COPY . /root/dotfiles

RUN /root/dotfiles/bin/install.sh
