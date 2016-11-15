#!/bin/sh
#$HOME/dotfiles/scripts/external-screen

# Start a D-Bus session
#source /etc/X11/xinit/xinitrc.d/30-dbus.sh
pulseaudio --start
/usr/bin/start-pulseaudio-x11

setxkbmap fr bepo

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

# Light Background color (solarized)
xsetroot -solid "#002630"
xrdb -merge $HOME/.Xresources
xset s 300 300                              # set monitor to sleep
xset -b                                     # Disable system bell
xset r rate 280 50                          # Repeat keys way faster please
urxvtd -q -f -o                             # start urxvt server

# Check if my TypeMatrix keyboard is connected
# If not, modify default bindings for the macbook air keyboard
$HOME/dotfiles/scripts/check-typematrix.zsh

#mpd

#/bin/dropboxd &

#exec i3
exec awesome >> ~/.cache/awesome/stdout 2>> ~/.cache/awesome/stderr
#exec gnome-session
