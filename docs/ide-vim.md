# IDE Vim Bindings

Vim emulation configurations for JetBrains IDEs and Visual Studio. Both use `,` as the leader key and share a common set of navigation patterns.

## IdeaVim (JetBrains IDEs)

**File**: `ideavimrc` → `~/.ideavimrc`

Applies to IntelliJ IDEA, WebStorm, GoLand, Rider, and all other JetBrains IDEs.

### Settings

- System clipboard enabled
- Relative + absolute line numbers

### Key Bindings

| Binding | Action |
|---------|--------|
| `gi` | Go to implementation |
| `gr` | Find usages |
| `Ctrl-o` | Navigate back |
| `Ctrl-i` | Navigate forward |
| `ma` | Toggle bookmark |
| `Alt-j` / `Alt-k` | Move line down/up |
| `< >` (visual) | Indent/dedent without leaving visual mode |

## VsVim (Visual Studio)

**File**: `vsvimrc` → `~/.vsvimrc`

### Settings

- System clipboard enabled

### Key Bindings

| Binding | Action |
|---------|--------|
| `gi` | Go to implementation |
| `gr` | Find all references |
| `Shift-k` | Quick info (hover) |
| `Ctrl-o` | Navigate backward |
| `Ctrl-i` | Navigate forward |
| `Alt-j` / `Alt-k` | Move line down/up |
| `,f` | Go to file |
| `,r` | Go to recent file |
| `,m` | Go to member |
| `,s` | Go to symbol |
| `,ne` | Next error |
| `,pe` | Previous error |
| `,tr` | Run tests in current context |

## Common Patterns

Both configs share these conventions:

- **`gi`** for go-to-implementation
- **`gr`** for find references/usages
- **`Ctrl-o` / `Ctrl-i`** for back/forward navigation
- **`Alt-j` / `Alt-k`** for moving lines
- These match the Neovim coc.nvim bindings where possible
