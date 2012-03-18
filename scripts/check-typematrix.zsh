#! /bin/zsh
connected=`lsusb | grep 'TypeMatrix' | wc -l`
if [ $connected -eq 0 ]
then
    source /home/vjousse/dotfiles/scripts/fix-apple-keyboard
fi
