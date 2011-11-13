DOTFILES=$HOME/dotfiles

# Load all my zsh files
for zsh_file ($DOTFILES/zsh/*.zsh) source $zsh_file

# Add fish-like syntax highlighting
source $DOTFILES/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
