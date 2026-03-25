#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ensure_dir() {
  mkdir -p "$1"
}

link_file() {
  local src="$1"
  local dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    mv "$dest" "${dest}.bak.$(date +%Y%m%d%H%M%S)"
  fi
  ln -sfn "$src" "$dest"
}

ensure_dir "$HOME/Library/Application Support/com.mitchellh.ghostty"
ensure_dir "$HOME/.config"

link_file "$ROOT_DIR/.zshrc" "$HOME/.zshrc"
link_file "$ROOT_DIR/Brewfile" "$HOME/Brewfile"
link_file "$ROOT_DIR/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
link_file "$ROOT_DIR/.config/nvim" "$HOME/.config/nvim"
link_file "$ROOT_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$ROOT_DIR/git/aliases" "$HOME/.gitconfig.d/aliases"

if [ ! -f "$HOME/.zshrc.local" ]; then
  cp "$ROOT_DIR/.zshrc.local.example" "$HOME/.zshrc.local"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if command -v brew >/dev/null 2>&1; then
  brew bundle --file "$HOME/Brewfile"
else
  echo "Homebrew not found. Install it, then run: brew bundle --file \"$HOME/Brewfile\""
fi
