#!/bin/bash
setxkbmap -option caps:swapescape

if xrandr | grep "DP-1"; then
	i3-msg "workspace 1:1, move workspace to output DP-1"
	i3-msg "workspace 9:Browser, move workspace to output HDMI-0"
	i3-msg "workspace 3:3, move workspace to output VGA-0"
	i3-msg "workspace 4:4, move workspace to output LVDS-0"
	i3-msg "workspace 1:1, exec alacritty"
fi

