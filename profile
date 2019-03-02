alias dc=docker-compose
alias vim-go="vim -u $HOME/.go.vimrc"
if ! [ -x "$(command -v pbcopy)" ]; then
    alias pbcopy='xclip -selection clipboard'
fi

if ! [ -x "$(command -v pbcopy)" ]; then
    alias pbpaste='xclip -selection clipboard -o'
fi

if [ -x "$(command -v xdg-open)" ]; then
    alias open=xdg-open
fi