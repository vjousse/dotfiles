# Inspiration : https://gist.github.com/numToStr/53a0bf7e8ac9c5aa98d52c112980fb0f

# Reclaim Ctrl+s and Ctrl+q (flow control)
stty stop undef
stty start undef

DOTFILES=$HOME/dotfiles

# /!\ Has to be at the beginning, otherwise I got a _autocomplete.command:local:2: bad option: -P error
autoload -Uz compinit && compinit


#########################################################################
# ZINIT
#########################################################################

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


#########################################################################
# Plugins
#########################################################################

zinit snippet OMZP::command-not-found
zinit snippet OMZP::dotenv
zinit snippet OMZP::extract
zinit snippet OMZP::git

zinit snippet OMZL::history.zsh


# GitHub Plugins
zinit light zsh-users/zsh-autosuggestions

# Bind Ctrl+n to accept autosuggest
bindkey '^n' autosuggest-accept

zinit light zdharma-continuum/fast-syntax-highlighting

# Auto-activate/switch python venvs
zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv


#########################################################################
# ALIASES
#########################################################################

# Push and pop directories on directory stack
alias startx='ssh-agent startx'
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias ..='cd ..'
alias -- -='cd -'

# Super user and preserve env vars
# Add a space at the end to preserve aliases, cf:
# http://www.gnu.org/software/bash/manual/bashref.html#Aliases
# https://github.com/janmoesen/tilde/commit/805e8117fd0fb429055d280509e14be8427c226b
alias _='sudo -E '

alias psg='ps aux | grep'
alias lg='lazygit'
alias ls='lsd -Fl'
alias lsa='ls -G -lah --color=auto'
alias l='ls -G -la --color=auto'
alias ll='ls -G -al --color=auto'
alias lr='ls -G -altr --color=auto'
alias lrh='ls -G -altrh --color=auto'
alias b='bat'

#Preserve my lovely env when in root
alias su='su -m'

alias g='git'
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gb='git branch'
alias gs='git status'
alias gco='git checkout'
alias gp='git pull'
alias gP='git push'
alias gsub='git submodule'
alias t='tig'
alias ya='yaourt'
alias s='source'
alias nv='nvim'
alias v='nvim'
alias taf='tail -f'
alias w='workon'
alias d='deactivate'
alias open='gio open'

# Reload zshrc conf
alias zreload='. ~/.zshrc'


#Global aliases
alias -g G='|grep -i'
alias -g L='|less '
alias -g C='|wc -l'

alias c='cargo'

#########################################################################
# KEYCHAIN
#########################################################################

if type "keychain" > /dev/null; then
    eval $(keychain --eval -Q --nogui --quiet id_rsa)
fi

if [ -f ~/.ssh/agent.env ] ; then
    . ~/.ssh/agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning a new agent. "
        eval `ssh-agent | tee ~/.ssh/agent.env`
        ssh-add
    fi
else
    echo "Starting ssh-agent"
    eval `ssh-agent | tee ~/.ssh/agent.env`
    ssh-add
fi


#########################################################################
# VARIABLES
#########################################################################

export CARGOBIN=$HOME/.cargo/bin
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/usr/src/python

export NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="/usr/local/texlive/2024/bin/x86_64-linux:$HOME/usr/bin:$HOME/usr/bin/roc:$DOTFILES/scripts:$HOME/.local/bin/:$CARGOBIN:$HOME/.yarn/bin:$NPM_PACKAGES/bin:$PATH"

export PYTHONPATH=".:$PYTHONPATH"

export EDITOR='nvim'
export GIT_EDITOR='nvim'
export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:$NPM_PACKAGES/share/man:$(manpath)"

export INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:$INFOPATH"

# https://github.com/pre-commit/pre-commit/issues/2178
SETUPTOOLS_USE_DISTUTILS=stdlib


source "$HOME/.cargo/env"

#########################################################################
# HISTORY SEARCH 
#########################################################################

# /!\ Has to be at the end otherwise I got some ZLE errors

zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^S' history-substring-search-up
bindkey '^T' history-substring-search-down
bindkey -M vicmd 's' history-substring-search-up
bindkey -M vicmd 't' history-substring-search-down


#########################################################################
# YAZI FILE MANAGER
#########################################################################
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


#########################################################################
# MISC
#########################################################################

eval "$(zoxide init zsh --cmd cd)"
eval "$(/home/vjousse/.local/bin/mise activate zsh)"
eval "$(starship init zsh)"

. "$HOME/.local/bin/env"

function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

# osc sequences for foot compatibility
function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

function precmd {
    if ! builtin zle; then
        print -n "\e]133;D\e\\"
    fi

    print -Pn "\e]133;A\e\\"
}

function preexec {
    print -n "\e]133;C\e\\"
}
