# Export common variables
#export JAVA_HOME=$HOME/usr/bin/jdk1.6.0_30
export GOPATH=$HOME/usr/src/go
export GOBIN=$GOPATH/bin
export CARGOBIN=$HOME/.cargo/bin

export PATH="./node_modules/elm-format/bin/:$JAVA_HOME/bin:$PATH:$HOME/usr/bin/ant-tools:$HOME/usr/bin:$DOTFILES/scripts:$DOTFILES/scripts/private:$HOME/usr/src/scala/play-2.2.1:/usr/share/java/apache-ant/bin:/home/vjousse/.cabal/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.npm-global/bin:$HOME/.local/bin/:$GOROOT/bin:$GOBIN:$CARGOBIN:$HOME/.yarn/bin:$HOME/.local/bin:$HOME/.gem/ruby/3.0.0/bin"

export PYTHONPATH=".:$PYTHONPATH"

export ANDROID_SDK=/opt/android-sdk

export TODO_DIR="$HOME/Nextcloud"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"

# Java/SBT configuration
export SBT_OPTS="-Dfile.encoding=UTF8 -Xms256M -Xmx2048M -Xss4M -XX:+CMSClassUnloadingEnabled"
export _JAVA_AWT_WM_NONREPARENTING=1

export BROWSER="firefox-nightly"
export EDITOR='nvim'
export GIT_EDITOR='nvim'

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


. $HOME/.asdf/asdf.sh
