#!/bin/bash
source "$(dirname $0)/common.sh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

bash $ROOT_DIR/bin/install-nvim.sh
bash $ROOT_DIR/bin/install-vim.sh

execute "create_dir $HOME/.config"
execute "create_dir $HOME/.local/bin"

symlink "${ROOT_DIR}/tmux.conf"
symlink "${ROOT_DIR}/tmux.conf.local"
symlink "${ROOT_DIR}/profile"
symlink "${ROOT_DIR}/gitignore"

git config --global dore.excludesfile $HOME/.gitignore

symlink "${ROOT_DIR}/ideavimrc"
symlink "${ROOT_DIR}/vsvimrc"

# OS detection
OS_TYPE="$(uname)"
if [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "Detected macOS"
    # Add any macOS-specific setup here
elif [[ "$OS_TYPE" == "Linux" ]]; then
    DISTRO=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
    if [[ "$DISTRO" == "Ubuntu" ]]; then
        echo "Linux Distro is Ubuntu"
        bash $ROOT_DIR/bin/ubuntu-post-install.sh
    fi
    # Add other Linux distro-specific setup here if needed
else
    echo "Unsupported OS: $OS_TYPE"
fi
