# Shell Configuration

Shell setup for Bash and Zsh with cross-platform support for macOS and Linux.

## Files

| File | Target | Purpose |
|------|--------|---------|
| `profile` | `~/.profile` | POSIX shell config — aliases, PATH, environment |
| `zprofile` | `~/.zprofile` | Zsh profile — PATH, local profile sourcing |

Both are symlinked to `~/` by `bin/install.sh`.

## Aliases

Defined in `profile`:

| Alias | Expansion | Notes |
|-------|-----------|-------|
| `cp` | `cp -i` | Confirm before overwriting |
| `df` | `df -h` | Human-readable sizes |
| `free` | `free -m` | Show sizes in MB |
| `gitu` | `git add . && git commit && git push` | Quick git push |
| `vi` | `vim` | |
| `dc` | `docker-compose` | |
| `open` | `xdg-open` | Linux only (native on macOS) |
| `pbcopy` | `xclip -selection clipboard` | Linux only (native on macOS) |
| `pbpaste` | `xclip -selection clipboard -o` | Linux only (native on macOS) |

## Environment Variables

| Variable | Value |
|----------|-------|
| `EDITOR` | `vim` |
| `GOPATH` | `~/Workspace/go` |

## PATH Additions

Added in order by `profile`:

1. Ruby gems user directory (if ruby and gem are available)
2. `~/Workspace/go/bin` (Go binaries)
3. `~/.cargo/bin` (Rust binaries)
4. `~/.local/bin` (local binaries)

The `zprofile` also prepends `~/.local/bin` to PATH.

## Local Overrides

`zprofile` sources `~/.zprofile.local` if it exists, for machine-specific settings not tracked in git.

### Per-Directory Profiles

The `zprofile` defines a `chpwd` hook that sources `.zprofile.local` in the current directory when you `cd` into it. This is useful for per-project environment setup (e.g., setting project-specific environment variables).

## Oh My Zsh

Installed automatically by `bin/install.sh` from the [official repository](https://github.com/ohmyzsh/ohmyzsh).
