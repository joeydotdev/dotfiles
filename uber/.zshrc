export ZSH="/Users/corgi/.oh-my-zsh"
export PATH="$(brew --prefix)/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# General aliases
alias reload-zsh="source ~/.zshrc"

# Uber aliases
alias pod-corgi="ssh corgi-web.devpod-us-or"
alias pod-go="ssh corgi-go.devpod-us-or"

# Git aliases
alias gca="git commit --amend --no-edit"
alias grom="git pull --rebase origin main"
alias gs="git status"


# Uber stuff
[ -r /Users/corgi/.profile_lda ] && . /Users/corgi/.profile_lda

