#!/bin/sh
#$HOME/dotfiles/scripts/external-screen

# Activate default xinitrc scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
/usr/bin/start-pulseaudio-x11

setxkbmap fr bepo

# Kill X with C-A-BS
setxkbmap -option terminate:ctrl_alt_bksp

xrdb -merge ~/.Xresources
xset s 300 300                              # set monitor to sleep
xset -b                                     # Disable system bell
xset r rate 280 50                          # Repeat keys way faster please
xrandr --dpi 192

# Check if my TypeMatrix keyboard is connected
# If not, modify default bindings for the macbook air keyboard
$HOME/dotfiles/scripts/check-typematrix.zsh

export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11

#exec gnome-session

exec i3
#exec gnome-session
#exec startxfce4
#export XDG_CURRENT_DESKTOP=Budgie:GNOME
#exec budgie-desktop

#exec gnome-session
#exec mate-session
