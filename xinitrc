#!/bin/sh
$HOME/dotfiles/scripts/external-screen

setxkbmap fr bepo

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

xsetroot -cursor_name left_ptr

xrdb -merge $HOME/.Xresources
xsetroot -solid black                       # black background
xset s 300 300                              # set monitor to sleep
xset -b                                     # Disable system bell
xset r rate 280 50                          # Repeat keys way faster please
urxvtd -q -f -o                             # start urxvt server

# Check if my TypeMatrix keyboard is connected
# If not, modify default bindings for the macbook air keyboard
$HOME/dotfiles/scripts/check-typematrix.zsh
mpd

exec $HOME/.cabal/bin/xmonad
#exec startxfce4
