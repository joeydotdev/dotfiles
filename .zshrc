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
    local commit_msg
    commit_msg=$(claude -p "Analyze the git diff and git status output to generate a concise commit message. Follow these rules:
1. Use lowercase, no punctuation at the end
2. Keep it brief  
3. Focus on the main change or feature
4. Use patterns like: 'feat: new feature', 'fix: bug fix', 'chore: bump dependency'
5. Examples: 'feat: new claude file', 'fix: update sourcing world', 'feat: idle task support', 'chore: minor patches'

Git status:
$(git status)

Git diff (staged changes):
$(git diff --cached)

Git diff (unstaged changes):
$(git diff)

Generate only the commit message, nothing else.")

    echo "\n\033[36m→ Suggested commit message:\033[0m"
    echo "\033[32m$commit_msg\033[0m\n"
    echo -n "\033[33m? Use this message and commit? (y/n)\033[0m "
    read -r confirm
    if [[ -z "$confirm" || "$confirm" == "y" || "$confirm" == "Y" || "$confirm" == "yes" || "$confirm" == "YES" ]]; then
        echo "\033[32m✓ Committing changes...\033[0m"
        git commit -m "$commit_msg"
    else
        echo "\033[31m✗ Commit aborted.\033[0m"
    fi
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
