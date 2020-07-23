#!/bin/bash
source "$(dirname $0)/common.sh"
INSTALL_PATH="${ROOT_DIR}/vimrc-go"

printf "${Cyan}Setting up vim-go.${Color_off}\n"

VIM_PLUG_PATH=~/.vim-go/autoload/plug.vim
VIM_GO_PATH="$HOME/.vimrc-go"

cat > "$VIM_GO_PATH" <<EOF
if empty(glob('$VIM_PLUG_PATH'))
  silent !curl -fLo $VIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source "$VIM_GO_PATH"
endif
source $INSTALL_PATH/basic.vim
source $INSTALL_PATH/filetypes.vim
source $INSTALL_PATH/plugins.vim
try
  source $INSTALL_PATH/custom_config.vim
catch
endtry
EOF

printf "${Cyan}Installation succcessful!${Color_off}\n"
printf "${Cyan}To use run: ${Yellow}vim -u $VIM_GO_PATH${Color_off}\n"
