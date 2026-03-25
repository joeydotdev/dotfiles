# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

if [ -d /opt/homebrew/bin ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
if [ -d /usr/local/bin ]; then
  export PATH="/usr/local/bin:$PATH"
fi
if [ -d /usr/local/go/bin ]; then
  export PATH="$PATH:/usr/local/go/bin"
fi
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if command -v brew >/dev/null 2>&1; then
  BREW_PREFIX="$(brew --prefix)"
  export PATH="$BREW_PREFIX/bin:$PATH"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
plugins=(git fzf)
if [ -d "$ZSH" ]; then
  source "$ZSH/oh-my-zsh.sh"
else
  PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %# '
fi

# General aliases
alias reload-zsh="source ~/.zshrc"

# Auto-generate commit message function
generate_commit_msg() {
    GCM_HOOK=1 git commit --allow-empty-message -m "wip"
}

# Alias for easy commit message generation
alias gcm='generate_commit_msg'

# Shell QoL (Warp-like)
if [ -n "${BREW_PREFIX:-}" ] && command -v fzf >/dev/null 2>&1; then
  source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"
  source "$BREW_PREFIX/opt/fzf/shell/completion.zsh"
fi

if [ -n "${BREW_PREFIX:-}" ] && [ -f "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -n "${BREW_PREFIX:-}" ] && [ -f "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
