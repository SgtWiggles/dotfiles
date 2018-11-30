#! /bin/bash
~/.config/screens.sh
~/.fehbg  
sleep 1 
echo "Set background"

killall compton
if ! pgrep -x "compton" > /dev/null; then
  /bin/compton --config ~/.config/compton/compton.conf &
fi
echo "Loaded compton"

~/.config/polybar/launch.sh
~/.config/music_start.sh
