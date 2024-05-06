#! /bin/zsh
connected=`swaymsg -t get_outputs | grep 'DELL S2722QC' | wc -l`
if [ $connected -eq 1 ]
then
    swaymsg "output eDP-1 disable"
fi
