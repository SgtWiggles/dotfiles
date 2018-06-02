#!/bin/bash
setxkbmap -option caps:swapescape
echo Swapped Escape

if xrandr | grep "DP-1 connected"; then
	i3-msg "workspace 0, move workspace to output DP-1"
	i3-msg "workspace 8, move workspace to output HDMI-0"
	i3-msg "workspace 2, move workspace to output VGA-0"
	i3-msg "workspace 3, move workspace to output LVDS-0"
fi

if ! pgrep -x redshift-gtk > /dev/null; then
redshift-gtk &
echo Started redshift
fi	

if ! pgrep -x mpd > /dev/null; then 
	mpd &
	echo Started mpd
fi

sh ~/.config/reload.sh &
echo Reloaded
