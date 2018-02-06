source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle extract

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search  

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


DOTFILES=$HOME/dotfiles

[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh
# [ -f /bin/virtualenvwrapper.sh ] && source /bin/virtualenvwrapper.sh

source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/configuration.zsh

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/usr/src/python

if type "keychain" > /dev/null; then
    eval $(keychain --eval -Q --nogui --quiet id_rsa)
fi
