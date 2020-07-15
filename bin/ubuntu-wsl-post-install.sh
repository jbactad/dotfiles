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
    docker.io \
    neovim \
    papirus-icon-theme \
    numix-icon-theme-circle \
&& sudo apt-get autoremove

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Docker and utils
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
pip3 install docker-compose --user

## Kubectl
sudo snap install --classic kubectl

## Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh && rm get_helm.sh

## minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/ && rm minikube

# Editor
## vs-code
sudo snap install --classic code 

# Messenger
sudo snap install --classic slack

# Utilities
sudo snap install pick-colour-picker
sudo snap install postman

