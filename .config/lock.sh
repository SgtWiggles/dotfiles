#! /bin/bash
maim  ~/.config/i3/lock.png
mogrify -resize %2  -resize %5000 ~/.config/i3/lock.png
i3lock -ni ~/.config/i3/lock.png

