#!/bin/sh
#$HOME/dotfiles/scripts/external-screen

setxkbmap fr bepo

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

# Light Background color (solarized)
xsetroot -solid "#fdf6e3"
xrdb -merge $HOME/.Xresources
xset s 300 300                              # set monitor to sleep
xset -b                                     # Disable system bell
xset r rate 280 50                          # Repeat keys way faster please
urxvtd -q -f -o                             # start urxvt server

/usr/bin/start-pulseaudio-x11

# Check if my TypeMatrix keyboard is connected
# If not, modify default bindings for the macbook air keyboard
$HOME/dotfiles/scripts/check-typematrix.zsh

#mpd

# Taken from https://wiki.archlinux.org/index.php/GNOME_Keyring
# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus.sh
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

/bin/dropboxd &

exec i3
