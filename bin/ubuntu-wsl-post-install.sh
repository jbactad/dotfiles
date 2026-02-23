sudo apt-get update \
&& sudo apt-get upgrade \
&& sudo apt-get install -y \
    tmux \
    zsh \
    git \
    vim \
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
    neofetch \
    htop \
    neovim \
&& sudo apt-get autoremove

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
