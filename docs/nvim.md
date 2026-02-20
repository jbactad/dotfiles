# Neovim Configuration

Full IDE-like Neovim setup with LSP support via [coc.nvim](https://github.com/neoclide/coc.nvim), session management, and language-specific settings.

## Installation

Handled by `bin/install-nvim.sh`, which:

1. Creates `~/.config/nvim/plugged` directory
2. Symlinks `coc-settings.json` and UltiSnips snippets
3. Downloads [vim-plug](https://github.com/junegunn/vim-plug)
4. Generates `~/.config/nvim/init.vim` that sources from the `nvimrc/` directory

## File Structure

```
nvimrc/
├── basic.vim       # Shared base settings (also used by vim)
├── plugins.vim     # Plugin declarations, coc.nvim config, lightline
├── filetypes.vim   # Language-specific autocommands and tagbar settings
└── coc/
    ├── coc-settings.json   # LSP and language server configuration
    └── ultisnips/          # Code snippets (Go, TypeScript, JSON, Rust)
```

## Base Settings

Defined in `basic.vim` (shared with Vim). Key defaults:

- **Leader key**: `,`
- **Indentation**: 4 spaces, expandtab
- **Color column**: 100
- **Folding**: syntax-based, all open by default
- **Search**: case-insensitive, smart case, incremental, highlighted
- **Clipboard**: system clipboard (`unnamedplus`)
- **Scroll offset**: 15 lines
- **Splits**: open right and below
- **Mouse**: enabled

## Plugins

Managed by [vim-plug](https://github.com/junegunn/vim-plug). Run `:PlugInstall` after first launch.

### Navigation

| Plugin | Purpose |
|--------|---------|
| NERDTree | File explorer (`Ctrl-n` to toggle) |
| nerdtree-git-plugin | Git status in NERDTree |
| Tagbar | Code outline sidebar |

### Appearance

| Plugin | Purpose |
|--------|---------|
| PaperColor (active) | Color scheme, dark with transparent background |
| Dracula, OneDark, cosmic_latte | Alternative color schemes |
| lightline.vim | Status line with diagnostics, git blame, session status |
| vim-devicons | File type icons |

### Editor

| Plugin | Purpose |
|--------|---------|
| coc.nvim | LSP client, completion, diagnostics |
| vim-polyglot | Language pack for syntax highlighting |
| vim-snippets | Snippet collection |
| nerdcommenter | Code commenting |

### Session

| Plugin | Purpose |
|--------|---------|
| vim-obsession | Continuous session saving |
| vim-prosession | Automatic session management (stored in `~/.nvim/session`) |
| undotree | Undo history visualization |

### Misc

| Plugin | Purpose |
|--------|---------|
| vim-wakatime | Coding time tracking |
| vimspector | Debugger (Go adapter enabled) |

## coc.nvim Extensions

Installed automatically on first launch:

`coc-rust-analyzer`, `coc-json`, `coc-lists`, `coc-snippets`, `coc-git`, `coc-go`, `coc-yaml`, `coc-tsserver`, `coc-yank`, `coc-db`, `coc-eslint`, `coc-pairs`, `coc-prettier`, `coc-vimlsp`, `coc-actions`, `coc-github`, `coc-omnisharp`, `coc-xml`

## Key Bindings

### General

| Binding | Action |
|---------|--------|
| `,w` | Save file |
| `jj` | Escape insert mode |
| `0` | Jump to first non-blank character |
| `Alt-j` / `Alt-k` | Move line down/up |
| `< >` (visual) | Indent/dedent without leaving visual mode |
| `,<CR>` | Clear search highlight |
| `Ctrl-j/k/h/l` | Navigate between windows |
| `,,` | Switch between last two files |

### Tabs

| Binding | Action |
|---------|--------|
| `,ta` | New tab |
| `,tc` | Close tab |
| `,tn` / `,tp` | Next/previous tab |
| `,tl` | Last accessed tab |
| `,te` | Edit in new tab (same directory) |

### Terminal

| Binding | Action |
|---------|--------|
| `,otv` | Open terminal in vertical split |
| `,ot` | Open terminal in horizontal split |

### NERDTree

| Binding | Action |
|---------|--------|
| `Ctrl-n` | Toggle NERDTree |
| `,nr` | Refresh NERDTree root |
| `,nf` | Find current file in NERDTree |

### Tagbar

| Binding | Action |
|---------|--------|
| `,tb` | Toggle Tagbar |

### coc.nvim - Code Navigation

| Binding | Action |
|---------|--------|
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Show documentation |
| `F2` | Rename symbol |
| `,ne` / `,pe` | Previous/next diagnostic |

### coc.nvim - Git Integration

| Binding | Action |
|---------|--------|
| `[g` / `]g` | Previous/next git chunk |
| `gs` | Show chunk diff |
| `gc` | Show commit at cursor |

### coc.nvim - Code Actions

| Binding | Action |
|---------|--------|
| `,f` | Format selected code |
| `,F` | Format entire buffer |
| `,a` | Code actions for selection |
| `,ac` | Code action for current line |
| `,qf` | Quick fix for current line |
| `Ctrl-s` | Selection ranges |

### coc.nvim - Lists (Space prefix)

| Binding | Action |
|---------|--------|
| `Space a` | All diagnostics |
| `Space e` | Manage extensions |
| `Space c` | Commands |
| `Space o` | Document outline |
| `Space s` | Workspace symbols |
| `Space b` | Buffers |
| `Space f` | Files |
| `Space j` / `Space k` | Next/previous item |
| `Space p` | Resume last list |

### Commands

| Command | Action |
|---------|--------|
| `:Format` | Format current buffer |
| `:Fold` | Fold current buffer |
| `:OR` | Organize imports |
| `:W` | Sudo save |

### Debugging (vimspector)

Uses `HUMAN` mappings. See [vimspector docs](https://github.com/puremourning/vimspector#human-mode) for the full binding reference.

### Spell Checking

| Binding | Action |
|---------|--------|
| `,ss` | Toggle spell check |
| `,sn` / `,sp` | Next/previous misspelling |
| `,sa` | Add word to dictionary |
| `,s?` | Suggest corrections |

## Language-Specific Settings

### Go

- Auto-organize imports on save (via coc.nvim)
- Trailing whitespace removed on save
- Tabs (noexpandtab)

### TypeScript / JavaScript

- 2-space indentation
- Trailing whitespace removed on save
- Tagbar integration with ctags

### Python

- Trailing whitespace removed on save

### Rust

- Trailing whitespace removed on save

### JSON

- 2-space indentation

### Vim

- Fold by marker
- Trailing whitespace removed on save

## Lightline Status Line

Left side: mode, git status, diagnostics, filename, modified indicator

Right side: line info, session status (Obsession), filetype, encoding, shiftwidth, git blame (on wide windows)
