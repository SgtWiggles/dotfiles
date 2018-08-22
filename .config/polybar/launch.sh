#!/bin/bash
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "/bin/xrandr" > /dev/null; then
  for m in $(/bin/xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar upper & 
  done
else
  polybar upper &
fi
echo  "" > /dev/null
