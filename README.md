# Dotfiles

## What this repo contains
- `~/.zshrc` (shell setup)
- `~/.zshrc.local.example` (machine-specific overrides template)
- `~/Brewfile` (Homebrew bundle)
- `~/.gitconfig` + `~/.gitconfig.d/aliases` (git settings and aliases)
- `~/.config/nvim` (Neovim config)
- Ghostty config: `~/Library/Application Support/com.mitchellh.ghostty/config`

## Install (new machine)
```bash
git clone git@github.com:joeydotdev/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
source ~/.zshrc
```

### Notes
- `install.sh` will:
  - create symlinks into `$HOME`
  - install Oh My Zsh (non-interactive)
  - run `brew bundle` if Homebrew is installed
- Put machine-specific tweaks in `~/.zshrc.local`

## Update workflow
1. Edit files in `~/dotfiles`
2. Commit and push

## Restore backups
When `install.sh` finds an existing file, it saves a timestamped `*.bak.*` file before symlinking.
