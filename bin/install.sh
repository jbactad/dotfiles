#!/bin/bash
source "$(dirname $0)/common.sh"

bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

bash $ROOT_DIR/bin/install-go-vim.sh
bash $ROOT_DIR/bin/install-vim.sh

execute "create_dir \"$HOME/.config\""
execute "create_dir \"$HOME/.local/bin\""

symlink "${ROOT_DIR}/tmux.conf"
symlink "${ROOT_DIR}/tmux.conf.local"
symlink "${ROOT_DIR}/profile"
