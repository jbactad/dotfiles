# Tmux Configuration

Configuration based on [gpakosz/.tmux](https://github.com/gpakosz/.tmux), with local customizations in `tmux.conf.local`.

> **Do not edit `tmux.conf` directly.** It tracks upstream. All customizations go in `tmux.conf.local`.

## Requirements

- tmux >= 2.1
- `$TERM` set to `xterm-256color` outside of tmux

## Installation

Handled automatically by `bin/install.sh`, which symlinks both `tmux.conf` and `tmux.conf.local` to `~/`.

### Plugins

Plugins are managed by [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm). After the initial install:

1. Install TPM:
   ```sh
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

2. Install plugins — inside tmux, press `<prefix> I` (Ctrl-a then Shift-I)

   Alternatively, from the command line:
   ```sh
   TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins ~/.tmux/plugins/tpm/bin/install_plugins
   ```

Declared plugins (`tmux.conf`):

| Plugin | Purpose |
|--------|---------|
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save and restore tmux sessions |
| [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) | Automatic continuous session saving |

To update plugins: `<prefix> U` (Ctrl-a then Shift-U).

## Local Customizations

The following overrides are applied in `tmux.conf.local`:

### Prefix Key

The default dual-prefix setup (`C-b` + `C-a`) is replaced with **`C-a` as the sole prefix**:

```
set -g prefix C-a
```

`C-b` is unbound.

### Window and Pane Behavior

| Setting | Value |
|---------|-------|
| New window retains current path | No |
| New pane retains current path | Yes |
| New pane reconnects SSH | No |
| Prompt for new session name | Yes |

### Mouse

Mouse mode is **enabled by default**.

### Automatic Window Rename

Windows are automatically renamed to the basename of the current working directory:

```
set-option -g automatic-rename-format '#{b:pane_current_path}'
```

### Session Persistence (tmux-continuum)

- Auto-save interval: 15 minutes
- Auto-start on boot: enabled
- Auto-restore on start: disabled (use `<prefix> C-r` to restore manually)

### Clipboard

Copy-to-OS-clipboard is enabled. Requires `reattach-to-user-namespace` on macOS, or `xsel`/`xclip` on Linux.

## Key Bindings

`<prefix>` is <kbd>Ctrl</kbd> + <kbd>a</kbd>.

### Sessions

| Binding | Action |
|---------|--------|
| `<prefix> C-c` | Create a new session |
| `<prefix> C-f` | Switch to another session by name |

### Windows

| Binding | Action |
|---------|--------|
| `<prefix> C-h` | Previous window |
| `<prefix> C-l` | Next window |
| `<prefix> Tab` | Last active window |

### Panes

| Binding | Action |
|---------|--------|
| `<prefix> -` | Split vertically |
| `<prefix> _` | Split horizontally |
| `<prefix> h/j/k/l` | Navigate panes (vim-style) |
| `<prefix> H/J/K/L` | Resize panes |
| `<prefix> <` / `<prefix> >` | Swap panes |
| `<prefix> +` | Maximize pane to new window (toggle) |

### Copy Mode

| Binding | Action |
|---------|--------|
| `<prefix> Enter` | Enter copy mode |
| `<prefix> b` | List paste buffers |
| `<prefix> p` | Paste from top buffer |
| `<prefix> P` | Choose paste buffer |

Copy-mode-vi bindings:

| Binding | Action |
|---------|--------|
| `v` | Begin selection |
| `C-v` | Toggle blockwise visual mode |
| `H` | Start of line |
| `L` | End of line |
| `y` | Copy selection |
| `Escape` | Cancel |

### General

| Binding | Action |
|---------|--------|
| `<prefix> e` | Edit `~/.tmux.conf.local` in `$EDITOR` |
| `<prefix> r` | Reload configuration |
| `C-l` | Clear screen and tmux history |
| `<prefix> m` | Toggle mouse mode |
| `<prefix> U` | Launch Urlview (if available) |
| `<prefix> F` | Launch Facebook PathPicker (if available) |

## Theme

- Color scheme: dark background (`#080808`) with light blue (`#00afff`) accents
- Pane borders: fat style, gray (`#444444`) inactive, light blue (`#00afff`) active
- Status left: session name (yellow), continuum status (pink), current command (blue)
- Status right: battery, time, date, username, hostname
- Window status: light gray inactive, bold light blue active
- Clock: light blue, 24-hour format

### Status Line Variables

The status line supports these built-in variables:

- `#{battery_bar}`, `#{battery_percentage}`, `#{battery_status}`
- `#{hostname}`, `#{hostname_ssh}`
- `#{username}`, `#{username_ssh}`
- `#{uptime_d}`, `#{uptime_h}`, `#{uptime_m}`
- `#{prefix}`, `#{pairing}`, `#{synchronized}`, `#{root}`
- `#{circled_session_name}`, `#{loadavg}`

External commands can be added via `#()` syntax (e.g., `#(curl wttr.in?format=3)` for weather).

## Troubleshooting

**Status line broken or duplicated**: Usually caused by glib/glibc Unicode width disagreement on Linux, or iTerm2's "Use Unicode version 9 character widths" setting on macOS.

**Powerline symbols not showing**: Install a [Nerd Font](https://www.nerdfonts.com/) or patched Powerline font (Fira Code Nerd Font is included in `third_party/`). Then uncomment the Powerline separator lines in `tmux.conf.local`.

**macOS clipboard not working**: Install `reattach-to-user-namespace` via `brew install reattach-to-user-namespace`. It will be detected automatically.
