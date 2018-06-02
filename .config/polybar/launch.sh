#!/bin/bash
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

if type "/bin/xrandr"; then
  for m in $(/bin/xrandr --query | grep " connected" | cut -d" " -f1); do
		H=$(date +%k)
		if [ "$H" -lt "7" ] || [ "$H" -gt "18" ]; then 
    	MONITOR=$m polybar -c ~/.config/polybar/config2 top &
		else
    	MONITOR=$m polybar momiji &
		fi
  done
else
  polybar momji &
fi
