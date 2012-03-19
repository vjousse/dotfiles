LINE=`xrandr -q | grep Screen`
echo LINE = ${LINE}
WIDTH=`echo ${LINE} | awk '{ print $8 }'`
echo WIDTH = ${WIDTH}
HEIGHT=`echo ${LINE} | awk '{ print $10 }' | awk -F"," '{ print $1 }'`
echo HEIGHT = ${HEIGHT}
