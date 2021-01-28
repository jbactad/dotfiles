#!/bin/bash
source "$(dirname $0)/common.sh"
INSTALL_PATH="${ROOT_DIR}/nvimrc"

printf "${Cyan}Setting up nvim${Color_off}\n"
mkdir -p "$HOME/.config/nvim/plugged"
ln -s -f "$INSTALL_PATH/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -s -f "$INSTALL_PATH/coc/ultisnips" "$HOME/.config/coc/ultisnips"

NVIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"
NVIM_PATH="$HOME/.config/nvim/init.vim"

cat > "$NVIM_PATH" <<EOF
if empty(glob('$NVIM_PLUG_PATH'))
  silent !curl -fLo $NVIM_PLUG_PATH --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync
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

