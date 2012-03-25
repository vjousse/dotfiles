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
    icon='^i(/home/vjousse/dotfiles/icons/clock.xpm)'
    today=$(date +$DATE_FORMAT)
    printf "^fg(white)%s %s^fg()" "$icon" "$today"
}
 
fgtime() {
    print -n "NY:" $(TZ='America/New_York' date +'%H:%M')
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

#    case $state in
#        "Charging") sign="|+|";;
#        "Discharging") sign="|-|" ;;
#        "Unknown") sign=" ⚡";;
#        "Full") sign="⚡"; percent= ;;
#        *) sign="$state" ;;
#    esac

    sign='^i(/home/vjousse/dotfiles/icons/power-bat.xbm)'

    printf "$modifier%s%s^fg()^bg()" "$percent" "$sign"
}

# LOAD AVERAGE

fload() {
    load=$(awk '{print $1}' /proc/loadavg)
    icon='^i(/home/vjousse/dotfiles/icons/load.xbm)'
    printf "%s%.01f %s^fg()" "^fg(#6c71c4)" "$load" "$icon"
}


fmem() {
    # MEMORY

    memory=$(free | awk '/buffers\/cache:/ {printf "%.0f", 100*$3/($3 + $4)}')
    if [ "$memory" -gt 90 ]; then modifier="^bg(#dc322f)^fg(white)"
    elif [ "$memory" -gt 80 ]; then modifier="^bg(#cb4b16)^fg(white)"
    elif [ "$memory" -gt 70 ]; then modifier="^fg(#b58900)"
    else modifier="^fg(#859900)"
    fi

    icon='^i(/home/vjousse/dotfiles/icons/mem.xbm)'
    printf "%s%s%% %s^fg()" "$modifier" "$memory" "$icon"
}


# Main
INTERFACE=wlan0
ICONPATH=/home/vjousse/dotfiles/icons

# Here we remember the previous rx/tx counts
RXB=`cat /sys/class/net/${INTERFACE}/statistics/rx_bytes`
TXB=`cat /sys/class/net/${INTERFACE}/statistics/tx_bytes`

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

   # get new rx/tx counts
   RXBN=`cat /sys/class/net/${INTERFACE}/statistics/rx_bytes`
   TXBN=`cat /sys/class/net/${INTERFACE}/statistics/tx_bytes`

   # calculate the rates
   # format the values to 4 digit fields
   RXR=$(printf "%4d\n" $(echo "($RXBN - $RXB) / 1024/${INTERVAL}" | bc))
   TXR=$(printf "%4d\n" $(echo "($TXBN - $TXB) / 1024/${INTERVAL}" | bc))

   if [ $RXR -eq 0 ]; then
       rxColor=""
   else
       rxColor="#859900"
   fi

   if [ $TXR -eq 0 ]; then
       txColor=""
   else
       txColor="#dc322f"
   fi

   # print out the rates with some nice formatting
   echo -n "^fg($rxColor)${RXR} Ko/s^p(3)^i(${ICONPATH}/arr_down.xbm)^fg($txColor)${TXR} Ko/s^i(${ICONPATH}/arr_up.xbm)^fg() "

   # reset old rates
   RXB=$RXBN; TXB=$TXBN

   # Arrange and print the status line
   print "— $PBAT $LOAD $MEM — $PGTIME $PDATE"
 
   DATECOUNTER=$((DATECOUNTER+1))
   GTIMECOUNTER=$((GTIMECOUNTER+1))
   BATCOUNTER=$((BATCOUNTER+1))
 
   sleep $INTERVAL
done
