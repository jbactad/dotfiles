#!/bin/bash
source "$(dirname $0)/common.sh"
INSTALL_PATH="${ROOT_DIR}/go-nvimrc"

printf "${Cyan}Setting up vim-go.${Color_off}\n"
mkdir -p "$HOME/.config/nvim/plugged"

NVIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"
NVIM_GO_PATH="$HOME/.config/nvim/init.vim"

cat > "$NVIM_GO_PATH" <<EOF
if empty(glob('$NVIM_PLUG_PATH'))
  silent !curl -fLo $NVIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync 
  silent !cd "$NVIM_PLUG_PATH/youcompleteme" && ./install.py --clang-completer --js-completer
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
