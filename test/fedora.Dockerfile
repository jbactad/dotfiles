FROM fedora

LABEL maintainer="Jim Geoshua Bactad"

RUN dnf install vim tmux -y

COPY . /root/dotfiles

RUN /root/dotfiles/bin/install.sh
