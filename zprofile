export PATH=$PATH:$HOME/.local/bin
[ -f "$HOME/.zprofile.local" ] && source "$HOME/.zprofile.local"

function chpwd() {
  if [[ -f "$PWD/.zprofile.local" ]]; then
    source "$PWD/.zprofile.local"
  fi
}

chpwd
