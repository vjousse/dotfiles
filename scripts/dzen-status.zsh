#!/bin/zsh
#
# xmonad statusline, (c) 2007 by Robert Manea
#
 
# Configuration
DATE_FORMAT='%a %d %b %H:%M'
TIME_ZONES=(Europe/London America/New_York)
DZEN_ICONPATH=
#MAILDIR=
 
# Main loop interval in seconds
INTERVAL=1
 
# function calling intervals in seconds
DATEIVAL=1
GTIMEIVAL=60
BATIVAL=1
 
# Functions
fdate() {
    date +$DATE_FORMAT
}
 
fgtime() {
    print -n "— NY:" $(TZ='America/New_York' date +'%H:%M')
}


# BATTERY
fbattery() {
    infos=$(acpi -b)
    percent=$(echo $infos|sed "s/Battery .: [a-z]*, \([0-9]*\)%\(,.*\|$\)/\1/i")
    state=$(echo $infos|sed "s/Battery .: \([a-z]*\),.*/\1/i")
    if [ "$percent" -lt 5 ]; then modifier="^bg(#dc322f)^fg(white)"
    elif [ "$percent" -lt 20 ]; then modifier="^bg(#cb4b16)^fg(white)"
    elif [ "$percent" -lt 50 ]; then modifier="^fg(#b58900)"
    else modifier="^fg(#859900)"
    fi

    percent="$percent%"

    case $state in
        "Charging") sign="|+|";;
        "Discharging") sign="|-|" ;;
        "Unknown") sign=" ⚡";;
        "Full") sign="⚡"; percent= ;;
        *) sign="$state" ;;
    esac
    printf "$modifier%s%s^fg()^bg()" "$percent" "$sign"
}

# LOAD AVERAGE

fload() {
    load=$(awk '{print $1}' /proc/loadavg)
    printf "%s%.01f l^fg()" "^fg(#6c71c4)" "$load"
}


fmem() {
    # MEMORY

    memory=$(free | awk '/buffers\/cache:/ {printf "%.0f", 100*$3/($3 + $4)}')
    if [ "$memory" -gt 90 ]; then modifier="^bg(#dc322f)^fg(white)"
    elif [ "$memory" -gt 80 ]; then modifier="^bg(#cb4b16)^fg(white)"
    elif [ "$memory" -gt 70 ]; then modifier="^fg(#b58900)"
    else modifier="^fg(#859900)"
    fi
    printf "%s%s%% █^fg()" "$modifier" "$memory"
}


# Main
 
# initialize data
DATECOUNTER=$DATEIVAL;GTIMECOUNTER=$GTIMEIVAL;BATCOUNTER=$BATIVAL;
 
while true; do
   if [ $DATECOUNTER -ge $DATEIVAL ]; then
     PDATE=$(fdate)
     DATECOUNTER=0
   fi
 
   if [ $GTIMECOUNTER -ge $GTIMEIVAL ]; then
     PGTIME=$(fgtime)
     GTIMECOUNTER=0
   fi
 
   if [ $BATCOUNTER -ge $BATIVAL ]; then
     PBAT=$(fbattery)
     BATCOUNTER=0
   fi

   LOAD=$(fload)
   MEM=$(fmem)
 
   # Arrange and print the status line
   print "$PBAT $LOAD $MEM $PGTIME ^fg(white)${PDATE}^fg()"
 
   DATECOUNTER=$((DATECOUNTER+1))
   GTIMECOUNTER=$((GTIMECOUNTER+1))
   BATCOUNTER=$((BATCOUNTER+1))
 
   sleep $INTERVAL
done
