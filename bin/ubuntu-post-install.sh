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
        python-dev \
        python-pip \ 
        python3-dev \
        python3-pip \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common \
        dconf-editor \
        gparted \
        shutter \
        neofetch \
        htop \
&& sudo apt-get autoremove

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Themes
sudo apt-get install numix-gtk-theme
sudo add-apt-repository ppa:system76/pop
sudo apt update
sudo apt install pop-icon-theme pop-theme

# Docker and utils
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

sudo apt-get install -y docker-ce docker-ce-cli containerd.io
pip install docker-compose --user

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

# neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

# Messenger
sudo snap install --classic slack

# Utilities
sudo snap install pick-colour-picker
sudo snap install mailspring
sudo snap install postman

