# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user and preserve env vars
alias _='sudo -E'

alias psg='ps aux | grep'

alias ls='ls --color=auto'
alias lsa='ls --color=auto -lah'
alias l='ls --color=auto -la'
alias ll='ls --color=auto -al'
alias lr='ls --color=auto -altr'

#Preserve my lovely env when in root
alias su='su -m'

alias g='git'
alias t='tig'
alias ya='yaourt'
alias s='source'
alias v='vim'
alias taf='tail -f'

# Reload zshrc conf
alias zreload='. ~/.zshrc'
