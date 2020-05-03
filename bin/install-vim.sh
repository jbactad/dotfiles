#!/bin/bash
source "$(dirname $0)/common.sh"
INSTALL_PATH="${ROOT_DIR}/vimrc"

printf "${Cyan}Setting up vim-go.${Color_off}\n"

VIM_PLUG_PATH=~/.vim/autoload/plug.vim
VIM_HOME="$HOME/.vim"
VIM_GO_PATH="$HOME/.vimrc"

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
