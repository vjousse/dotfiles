# Push and pop directories on directory stack
alias startx='ssh-agent startx'
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user and preserve env vars
# Add a space at the end to preserve aliases, cf:
# http://www.gnu.org/software/bash/manual/bashref.html#Aliases
# https://github.com/janmoesen/tilde/commit/805e8117fd0fb429055d280509e14be8427c226b
alias _='sudo -E '

alias psg='ps aux | grep'

alias ls='ls -G --color=auto'
alias lsa='ls -G -lah --color=auto'
alias l='ls -G -la --color=auto'
alias ll='ls -G -al --color=auto'
alias lr='ls -G -altr --color=auto'
alias lrh='ls -G -altrh --color=auto'

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
alias v='vim'
alias taf='tail -f'
alias w='workon'
alias d='deactivate'
alias open='gio open'

# Reload zshrc conf
alias zreload='. ~/.zshrc'

#Suffix aliases
alias -s html=vim
alias -s pdf=apvlv

alias -s png=feh
alias -s jpg=feh
alias -s gif=feh

#Global aliases
alias -g G='|grep ' 
alias -g L='|less ' 
alias -g C='|wc -l' 

alias c='pygmentize -g'
