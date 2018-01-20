# Export common variables
#export JAVA_HOME=$HOME/usr/bin/jdk1.6.0_30
export PATH="$JAVA_HOME/bin:$PATH:$HOME/usr/bin/ant-tools:$HOME/usr/bin:$DOTFILES/scripts:$DOTFILES/scripts/private:$HOME/usr/src/scala/play-2.2.1:/usr/share/java/apache-ant/bin:/home/vjousse/.cabal/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.npm-global/bin:$HOME/.local/bin/"

# Java/SBT configuration
export SBT_OPTS="-Dfile.encoding=UTF8 -Xms256M -Xmx2048M -Xss4M -XX:+CMSClassUnloadingEnabled"
export _JAVA_AWT_WM_NONREPARENTING=1

export BROWSER="firefox-nightly"
export EDITOR='vim'
export GIT_EDITOR='vim'
export CLASSPATH=$CLASSPATH:$HOME/usr/lib
