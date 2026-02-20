# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for macOS and Linux (Ubuntu, Fedora). Configurations are symlinked from this repo to the home directory via install scripts.

## Tech Stack

- Shell: Bash, Zsh
- Editors: Vim, Neovim (vim-plug), JetBrains IDEs (IdeaVim), Visual Studio (VsVim)
- Terminal multiplexer: Tmux (based on gpakosz/.tmux)
- Fonts: Fira Code Nerd Font

## Commands

```bash
# Install all configurations (creates symlinks, installs plugins)
./bin/install.sh

# Test installation in Docker containers (Ubuntu + Fedora)
./bin/test.sh
```

## Project Structure

```
bin/                  # Installation and utility scripts
  install.sh          # Main entry point - symlinks configs, calls sub-installers
  install-vim.sh      # Vim setup (vim-plug, generates ~/.vimrc)
  install-nvim.sh     # Neovim setup (vim-plug, coc, generates ~/.config/nvim/init.vim)
  install-vim-go.sh   # Go-specific vim config (generates ~/.vimrc-go)
  common.sh           # Shared helpers: execute(), symlink(), create_dir(), need_cmd()
  ubuntu-post-install.sh   # Ubuntu package installation
  test.sh             # Docker-based installation tests
docs/                 # Documentation (tmux.md, nvim.md, vim.md)
vimrc/                # Vim config (basic.vim, plugins.vim, filetypes.vim)
nvimrc/               # Neovim config + coc/ settings and ultisnips/ snippets
vimrc-go/             # Alternative Go-focused vim config
test/                 # Dockerfiles for Ubuntu and Fedora test environments
third_party/          # Fira Code Nerd Font files
profile               # POSIX shell config (aliases, PATH, clipboard compat)
zprofile              # Zsh profile (PATH, local profile sourcing, chpwd hook)
tmux.conf             # Tmux config (DO NOT EDIT - override in tmux.conf.local)
tmux.conf.local       # Tmux local overrides (theme, colors, display)
ideavimrc             # JetBrains IDE vim bindings
vsvimrc               # Visual Studio vim bindings
gitignore             # Global git ignore patterns
```

## Architecture

**Symlink strategy**: `install.sh` symlinks repo files to `~/` (e.g., `tmux.conf` → `~/.tmux.conf`). Vim/Neovim configs are generated files that source from the repo's `vimrc/` and `nvimrc/` directories.

**Local override pattern**: Configs support `.local` variants that are gitignored (e.g., `~/.zprofile.local`, `~/.tmux.conf.local`). The `zprofile` also sources per-directory `.zprofile.local` files via a `chpwd` hook.

**Modular vim config**: Both vim and neovim split config into `basic.vim`, `plugins.vim`, `filetypes.vim`, and optional `custom_config.vim`. These are sourced in order by the generated rc file.

**OS detection**: `install.sh` detects Darwin/Linux and runs platform-specific setup. Shell configs use similar detection for clipboard aliases (pbcopy/pbpaste vs xclip).

**Tmux**: `tmux.conf` is upstream from gpakosz/.tmux and should not be edited directly. All customization goes in `tmux.conf.local`.
