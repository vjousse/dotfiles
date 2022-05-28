# Export common variables
export CARGOBIN=$HOME/.cargo/bin
export VOLTA_HOME="$HOME/.volta"
NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$VOLTA_HOME/bin:$HOME/usr/bin:$DOTFILES/scripts:$HOME/.local/bin/:$CARGOBIN:$HOME/.yarn/bin:$NPM_PACKAGES/bin:$PATH"

export PYTHONPATH=".:$PYTHONPATH"

export BROWSER="firefox-nightly"
export EDITOR='nvim'
export GIT_EDITOR='nvim'

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(pyenv virtualenv-init -)"
