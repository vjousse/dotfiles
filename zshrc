eval `keychain --eval --agents ssh --nogui -Q -q id_rsa`

DOTFILES=$HOME/dotfiles

# Load all of the config files in oh-my-zsh that end in .zsh
for config_file ($DOTFILES/oh-my-zsh/lib/*.zsh) source $config_file
#
# # Load chosen oh-my-zsh plugins
for plugin in archlinux extract; do
 source $DOTFILES/oh-my-zsh/plugins/$plugin/$plugin.plugin.zsh
done

# Load all my zsh files
for zsh_file ($DOTFILES/zsh/*.zsh) source $zsh_file

# Add fish-like syntax highlighting
source $DOTFILES/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable completion after all plugins are loaded
autoload -U compinit
compinit -i

# Auto correct
setopt correctall

source /etc/profile.d/autojump.zsh

eval `dircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-dark`
