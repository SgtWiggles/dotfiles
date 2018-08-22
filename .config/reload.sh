#!/bin/bash
if xrandr | grep "DP-1 connected"; then
	~/.screenlayout/foo.sh &  sleep 1 &
fi
echo set screen layout

~/.fehbg & sleep 1 &
echo set background

if ! pgrep -x "compton" > /dev/null
then
  /bin/compton &
fi
echo loaded compton

~/.config/polybar/launch.sh
echo reloaded polybar
