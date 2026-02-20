# Vim Configuration

Lighter Vim setup sharing the same base settings as the Neovim configuration, with a smaller plugin set.

## Installation

Handled by `bin/install-vim.sh`, which:

1. Downloads [vim-plug](https://github.com/junegunn/vim-plug)
2. Generates `~/.vimrc` that sources from the `vimrc/` directory

## File Structure

```
vimrc/
├── basic.vim         # Shared base settings (same file as nvimrc/basic.vim)
├── plugins.vim       # Plugin declarations and NERDTree config
├── filetypes.vim     # Language-specific settings (empty by default)
└── custom_config.vim # Optional user overrides (not tracked)
```

## Differences from Neovim

Vim uses a reduced plugin set — no coc.nvim, no lightline, no session management, no debugger:

| Plugin | Purpose |
|--------|---------|
| NERDTree | File explorer |
| nerdtree-git-plugin | Git status in NERDTree |
| ctrlp.vim | Fuzzy file finder |
| nerdcommenter | Code commenting |
| PaperColor | Color scheme (dark, transparent background) |
| cosmic_latte | Alternative color scheme |
| vim-wakatime | Coding time tracking |
| vim-devicons | File type icons |

## Key Bindings

All base key bindings from `basic.vim` are shared with Neovim — see [nvim.md](nvim.md) for the full reference.

Vim-specific plugin bindings:

| Binding | Action |
|---------|--------|
| `Ctrl-n` | Toggle NERDTree |
| `,nr` | Refresh NERDTree root |
| `,nf` | Find current file in NERDTree |
| `Ctrl-p` | Fuzzy file finder (ctrlp) |

## Go-Specific Configuration

An alternative Vim configuration optimized for Go is available in `vimrc-go/`. Install with:

```sh
./bin/install-vim-go.sh
```

Then launch with:

```sh
vim -u ~/.vimrc-go
```
