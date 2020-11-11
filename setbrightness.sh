#!/bin/bash

CURRENT_BRIGHTNESS=`xrandr --current --verbose | grep Brightness | sed 's/[^\.0-9]//g'`

if [ $1 == '+' ]
then
  SET_BRIGHTNESS=`echo $CURRENT_BRIGHTNESS + 0.1 | bc`
else
  SET_BRIGHTNESS=`echo $CURRENT_BRIGHTNESS - 0.1 | bc`
fi

if (( $(echo $SET_BRIGHTNESS " <= 1 && " $SET_BRIGHTNESS " > 0.1" | bc -l) ))
then
  xrandr --output eDP-1 --brightness $SET_BRIGHTNESS
fi
