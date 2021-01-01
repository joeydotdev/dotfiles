if [ ! -f ~/.brew.zsh ]; then
  brew shellenv > ~/.brew.zsh
fi

source ~/.brew.zsh
export ZSH="/Users/joey/.oh-my-zsh"

ZSH_THEME="robbyrussell"
TERM=xterm

plugins=(
  git colorize pip python brew osx
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

source $ZSH/oh-my-zsh.sh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=$PATH:/usr/local/go/bin
export PATH="$(brew --prefix)/bin:$PATH"

# General aliases
alias reload-zsh="source ~/.zshrc"
alias reload-tmux="tmux source ~/.tmux.conf"

# Git aliases
alias gca="git commit --amend --no-edit"
alias grom="git pull --rebase origin master && git pull --rebase origin main"
alias gs="git status"
