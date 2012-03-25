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
MAILIVAL=60
CPUTEMPIVAL=1
WEATHERIVAL=1800
 
# Functions
fdate() {
    date +$DATE_FORMAT
}
 
fgtime() {
    local i
    { print -n "NY:" $(TZ='America/New_York' date +'%H:%M')' ' }
}
 
# Main
 
# initialize data
DATECOUNTER=$DATEIVAL;MAILCOUNTER=$MAILIVAL;GTIMECOUNTER=$GTIMEIVAL;CPUTEMPCOUNTER=$CPUTEMPIVAL;WEATHERCOUNTER=$WEATHERIVAL
 
while true; do
   if [ $DATECOUNTER -ge $DATEIVAL ]; then
     PDATE=$(fdate)
     DATECOUNTER=0
   fi
 
   if [ $GTIMECOUNTER -ge $GTIMEIVAL ]; then
     PGTIME=$(fgtime)
     GTIMECOUNTER=0
   fi
 
 
   # Arrange and print the status line
   print "$PGTIME ^fg(white)${PDATE}^fg()"
 
   DATECOUNTER=$((DATECOUNTER+1))
   GTIMECOUNTER=$((GTIMECOUNTER+1))
 
   sleep $INTERVAL
done
