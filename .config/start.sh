#!/bin/bash
	setxkbmap -option caps:swapescape
	xmodmap -e 'keycode 65 = space underscore'
	echo "Swapped Escape"


if ! pgrep -x redshift-gtk > /dev/null; then
redshift-gtk &
echo Started redshift
fi	

if ! pgrep -x mpd > /dev/null; then 
	mpd &
	echo Started mpd
fi


bash ~/.config/reload.sh &
echo Reloaded
