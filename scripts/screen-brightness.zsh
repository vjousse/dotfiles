#!/bin/zsh

DISPLAY_BRIGHTNESS_MAX=15
DISPLAY_BRIGHTNESS_CUR=`cat /sys/class/backlight/acpi_video0/brightness`
NEW_VALUE=$DISPLAY_BRIGHTNESS_CUR

if [[ $1 == "down" && $DISPLAY_BRIGHTNESS_CUR -gt 1 ]]; then
    ((NEW_VALUE=DISPLAY_BRIGHTNESS_CUR-1))
elif [[ $1 == "up" && $DISPLAY_BRIGHTNESS_CUR -lt $DISPLAY_BRIGHTNESS_MAX ]]; then
    ((NEW_VALUE=DISPLAY_BRIGHTNESS_CUR+1))
fi

echo $NEW_VALUE > /sys/class/backlight/acpi_video0/brightness
