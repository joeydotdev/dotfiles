# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

export PATH=$PATH:/usr/local/go/bin
export PATH="$(brew --prefix)/bin:$PATH"

# General aliases
alias reload-zsh="source ~/.zshrc"

# Git aliases
alias gca="git commit --amend --no-edit"
alias grom="git pull --rebase origin master && git pull --rebase origin main"
alias gs="git status"

# Auto-generate commit message function
generate_commit_msg() {
    local commit_msg
    commit_msg=$(claude -p "Analyze the git diff and git status output to generate a concise commit message. Follow these rules:
1. Use lowercase, no punctuation at the end
2. Keep it brief  
3. Focus on the main change or feature
4. Use patterns like: 'feat: new feature', 'fix', 'chore: bump dependency'
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
    echo -n "\033[33m? Do you want to use this message and commit? (y/n)\033[0m "
    read confirm
    if [[ "$confirm" == "y" ]]; then
        echo "\033[32m✓ Committing changes...\033[0m"
        git commit -m "$commit_msg"
    else
        echo "\033[31m✗ Commit aborted.\033[0m"
    fi
}

# Alias for easy commit message generation
alias gcm='generate_commit_msg'

