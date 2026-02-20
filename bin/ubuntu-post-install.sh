sudo apt-get update \
&& sudo apt-get upgrade \
&& sudo apt-get install -y \
    tmux \
    zsh \
    git \
    vim \
    gnome-tweaks \
    chrome-gnome-shell \
    curl \
    build-essential \
    cmake \
    python3-dev \
    python3-pip \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    dconf-editor \
    gparted \
    neofetch \
    htop \
    neovim \
    papirus-icon-theme \
    numix-icon-theme-circle \
&& sudo apt-get autoremove

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Editor
## vs-code
sudo snap install --classic code 

# Messenger
sudo snap install --classic slack

# Utilities
sudo snap install pick-colour-picker
sudo snap install postman

