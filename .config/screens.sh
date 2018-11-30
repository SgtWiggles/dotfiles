#! /bin/bash
OUTPUT=xrandr
if  echo "$OUTPUT" | grep "DP-1 connected"; then
xrandr --output VGA-0 --mode 1920x1080 --pos 0x472 --rotate normal --output LVDS-0 --off --output HDMI-0 --mode 1920x1080 --pos 3840x0 --rotate left --output DP-1 --primary --mode 1920x1080 --pos 1920x472 --rotate normal --output DP-0 --off
sleep 1
i3-msg "workspace 0, move workspace to output DP-1"
i3-msg "workspace 8, move workspace to output HDMI-0"
i3-msg "workspace 10, move workspace to output VGA-0"
fi

echo set screen layout
