#!/bin/sh
source "$(cd $(dirname $0) ; pwd -P )/colors.sh"

printf "${Cyan}Setting up vim-go.${Color_off}\n"

VIM_PLUG_PATH=~/.vim/autoload/plug.vim
INSTALL_PATH="$(cd $(dirname $0)/../go-vimrc ; pwd -P )"
VIM_HOME="$HOME/.vim"
VIM_GO_PATH="$HOME/.go.vimrc"

cat > "$VIM_GO_PATH" <<EOF
if empty(glob('$VIM_PLUG_PATH'))
  silent !curl -fLo $VIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source "$VIM_GO_PATH"
endif
source $INSTALL_PATH/basic.vim
source $INSTALL_PATH/filetypes.vim
source $INSTALL_PATH/plugins.vim
source $INSTALL_PATH/extended.vim
try
  source $INSTALL_PATH/custom_config.vim
catch
endtry
EOF

printf "${Cyan}Installation succcessful!${Color_off}\n"
printf "${Cyan}To use run: ${Yellow}vim -u $VIM_GO_PATH${Color_off}\n"
