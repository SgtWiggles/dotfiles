#!/bin/sh
H=$(date +%k)
if [ "$H" -lt "7" ] || [ "$H" -gt "18" ]; then 
	color_foreground="f2/f2/ec"
	color_background="28/2a/36"
	
	printf_template='\033]4;%d;rgb:%s\033\\'
	printf_template_var='\033]%d;rgb:%s\033\\'
	printf_template_custom='\033]%s%s\033\\'
	
	# foreground / background / cursor color
	printf $printf_template_var 10 $color_foreground
	printf $printf_template_var 11 $color_background
	
	# clean up
	unset printf_template
	unset printf_template_var
	unset color_foreground
	unset color_background
	
	line=$(sed '2q;d' ~/.fehbg)
	if [ "$line" != *"night"* ]; then
		/usr/bin/feh --bg-center ~/Pictures/nightbg.png &
		echo night > ~/.config/current-bg.txt
	fi
else
	line=$(sed '2q;d' ~/.fehbg)
	if [ "$line" != "momijibg2" ]; then
		/usr/bin/feh --bg-center ~/Pictures/momijibg2.png &
		echo day > ~/.config/current-bg.txt
	fi
fi
