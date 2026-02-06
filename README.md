# kickstart.term

Terminal configuration for macOS - tmux setup with session management.

## Quick Start

```bash
make install
```

This will:
1. Install dependencies via Homebrew (tmux, fzf)
2. Create symlinks to your home directory
3. Configure `.zshrc` to load aliases
4. Show tmux plugin installation instructions

## Manual Installation

```bash
make install-deps    # Install tmux, fzf via Homebrew
make install-links   # Create symlinks only
make install-zsh     # Configure .zshrc
make install-plugins # Show plugin install instructions
```

## Uninstall

```bash
make uninstall       # Remove symlinks (keeps backups)
```

## What's Included

### Tmux Configuration
Full tmux setup with:
- Prefix: `Ctrl+a`
- Vim-style navigation
- Session persistence (resurrect + continuum)
- Fuzzy finder integration (fzf)
- Quick text selection (thumbs)

See [tmux/README.md](tmux/README.md) for keybindings and documentation.

### Shell Function: `wedi`
Creates or attaches to a tmux session named "wedi":

```bash
wedi   # Attach to existing session or create new one
```

## Symlinks Created

| Home | Repository |
|------|------------|
| `~/.tmux.conf` | `tmux/.tmux.conf` |
| `~/.bash_aliases` | `.bash_aliases` |

## Requirements

- macOS with [Homebrew](https://brew.sh)
- Zsh (default on macOS)
