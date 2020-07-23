alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias vi=vim
alias dc=docker-compose
alias open=xdg-open

if ! [ -x "$(command -v pbcopy)" ]; then
    alias pbcopy='xclip -selection clipboard'
fi

if ! [ -x "$(command -v pbcopy)" ]; then
    alias pbpaste='xclip -selection clipboard -o'
fi

if [ -x "$(command -v xdg-open)" ]; then
    alias open=xdg-open
fi

## Export section
if which ruby >/dev/null && which gem >/dev/null; then
    export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$HOME/Workspace/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export EDITOR=vim

