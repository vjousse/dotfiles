#!/bin/sh
#$HOME/dotfiles/scripts/external-screen

# Activate default xinitrc scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
pulseaudio --start
/usr/bin/start-pulseaudio-x11

setxkbmap fr bepo

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xset s 300 300                              # set monitor to sleep
xset -b                                     # Disable system bell
xset r rate 280 50                          # Repeat keys way faster please
#urxvtd -q -f -o                             # start urxvt server

# Check if my TypeMatrix keyboard is connected
# If not, modify default bindings for the macbook air keyboard
$HOME/dotfiles/scripts/check-typematrix.zsh

exec i3
#exec gnome-session
