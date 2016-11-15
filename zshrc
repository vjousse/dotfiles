ttyctl -f
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
# Theme from here: https://github.com/KuoE0/oh-my-zsh-solarized-powerline-theme

ZSH_THEME="solarized-powerline-vjousse"
ZSH_POWERLINE_SHOW_OS="false"
ZSH_POWERLINE_SHOW_USER="false"
ZSH_POWERLINE_SHOW_IP="false"
ZSH_POWERLINE_DIRECTORY_DEPTH=5
DEFAULT_USER="vjousse"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search archlinux extract)

source $ZSH/oh-my-zsh.sh

# User configuration

DOTFILES=$HOME/dotfiles

# Load private configuration
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# Auto correct
setopt correctall

[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh

source $DOTFILES/zsh/syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/configuration.zsh

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/usr/src/python
source $HOME/.local/bin/virtualenvwrapper.sh

eval $(keychain --eval -Q --nogui --quiet id_rsa)

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/vjousse/usr/lib

# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
