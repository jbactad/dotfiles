# dotfiles

My personal dotfiles for macos and linux distros.

## Getting Started

- Clone the project.
  ```sh
  git clone https://github.com/jbactad/dotfiles.git
  ```

### Prerequisites
- git
- curl
- zsh
- tmux
- vim

Debian/Ubuntu
```sh
sudo apt-get install git curl zsh tmux vim -y
```

Fedora
```sh
sudo dnf install git curl zsh tmux vim -y
```

Macos
Git can be instal
```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

brew install curl zsh git tmux vim
```

### Installing
Inside the local repository
```sh
./bin/install.sh
```
