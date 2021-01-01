DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting install..."

####################
# Symlinks
####################

echo "Starting Symlinks..."

ln -sf "$DOTFILES_DIR/gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/gitignore_global" ~/.gitignore_global
ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf

echo "Installation complete..."

