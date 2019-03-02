#!/bin/bash
source "$(dirname $0)/common.sh"
# utils
need_cmd () {
    if ! command -v "$1" > /dev/null 2>&1
    then printf "${Red}need '$1' (command not found)${Color_off}\n"
    fi
}

# Symlinks the configs
symlink () {
    FILENAME=$(basename $1)
    TARGET=$ROOT_DIR/$FILENAME
    FILE=$HOME/.$FILENAME
    if [ -e "$FILE" ]
    then
        if file $FILE | grep $ROOT_DIR &> /dev/null;then
            printf "Installed $Red$FILE${Color_off}\n"
        else
            printf "Skipping $Red$FILE${Color_off}\n"
        fi
    else
        printf "Linking $Cyan$FILE${Color_off} -> $Blue$TARGET${Color_off}\n"
        ln -s "$TARGET" "$FILE"
    fi
}

create_dir () {
    if [ ! -d "$1" ];then
      mkdir -p "$1"
    fi 
}

bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

bash $ROOT_DIR/bin/install-go-vim.sh

create_dir "$HOME/.config"
create_dir "$HOME/.local/bin"

symlink "${ROOT_DIR}/tmux.conf"
symlink "${ROOT_DIR}/tmux.conf.local"
symlink "${ROOT_DIR}/vimrc"
symlink "${ROOT_DIR}/profile"
