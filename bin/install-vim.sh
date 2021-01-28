#!/bin/bash
source "$(dirname $0)/common.sh"
INSTALL_PATH="${ROOT_DIR}/vimrc"

printf "${Cyan}Setting up vim.${Color_off}\n"

VIM_PLUG_PATH=~/.vim/autoload/plug.vim
VIM_PATH="$HOME/.vimrc"

cat > "$VIM_PATH" <<EOF
if empty(glob('$VIM_PLUG_PATH'))
  silent !curl -fLo $VIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source "$VIM_PATH"
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
