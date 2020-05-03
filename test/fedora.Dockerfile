FROM fedora

LABEL maintainer="Jim Geoshua Bactad"

RUN dnf install vim tmux git zsh -y

COPY . /root/dotfiles

RUN /root/dotfiles/bin/install.sh
