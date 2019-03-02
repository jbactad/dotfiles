#!/bin/bash
# Init colors
export INSTALL_PATH="$(cd $(dirname $0)/../ ; pwd -P )"
source $INSTALL_PATH/bin/colors.sh
# utils
need_cmd () {
    if ! command -v "$1" > /dev/null 2>&1
    then printf "${Red}need '$1' (command not found)${Color_off}\n"
    fi
}

# Symlinks the configs
symlink () {
    FILENAME=$(basename $1)
    TARGET=$INSTALL_PATH/$FILENAME
    FILE=$HOME/.$FILENAME
    if [ -e "$FILE" ]
    then
        if file $FILE | grep $INSTALL_PATH &> /dev/null;then
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

bash $INSTALL_PATH/bin/install-go-vim.sh

create_dir "$HOME/.config"
create_dir "$HOME/.local/bin"

symlink "${INSTALL_PATH}/tmux.conf"
symlink "${INSTALL_PATH}/tmux.conf.local"
symlink "${INSTALL_PATH}/vimrc"
symlink "${INSTALL_PATH}/profile"