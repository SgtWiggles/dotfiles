[global/wm]
margin-top = 0
margin-bottom = 0

[bar/upper]
monitor = ${env:MONITOR:LVDS-0}
override-redirect = false
bottom = false
fixed-center = true
enable-ipc = true

width = 100%
height = 22

font-0 = "Noto Sans CJK JP:size=9;2"
font-1 = "Material Icons:size=9;3"
font-2 = "FontAwesome:size=9;3"
font-3 = "Noto Sans Mono CJK JP:size=9;2"

background = ${color.background}
foreground = ${color.foreground}

line-color = ${color.foreground}

overline-size = 0
underline-size = 1

border-bottom-size = 1
border-bottom-color = ${color.border-bottom}

padding-left = 3
padding-right = 3
module-margin-left = 1
module-margin-right = 2

tray-position = right
tray-padding = 2
tray-maxsize = 16

scroll-up = i3wm-wsnext
scroll-down = i3wm-wsprev

modules-left =  mpd
modules-right = pulseaudio cpu memory wifi battery cpufreq date
modules-center = i3

;modules-left = xwindow
;modules-center = i3
;modules-right = wifi cpu memory battery pulseaudio date

[module/cpufreq]
type = custom/script
exec = cpupower frequency-info -fm | grep -oP '(?<=frequency: )([^ ]+ [^ ]+)'
interval = 2

[module/mpd]
type = internal/mpd
;format-online = <icon-prev> <icon-stop> <toggle> <icon-next>  <icon-repeat> <icon-random> <bar-progress> <label-time> <label-song>
format-online = <icon-prev> <toggle> <icon-next> <icon-repeat> <icon-random> <bar-progress> <label-time> <label-song>

label-song = %artist% - %title%
label-time = %elapsed%/%total%

icon-play = 
icon-pause = 
icon-stop = 
icon-prev = 
icon-next = 
icon-random = 
icon-repeat = 

toggle-on-foreground =
toggle-off-foreground = #55

bar-progress-width = 15
bar-progress-format = %{A4:mpdseek+2: A5:mpdseek-2:}%fill%%indicator%%empty%%{A A}
bar-progress-indicator = |
bar-progress-indicator-foreground = ${color.foreground}
bar-progress-indicator-font = 3
bar-progress-fill = ─
bar-progress-fill-foreground = #bb
bar-progress-fill-font = 3
bar-progress-empty = ─
bar-progress-empty-font = 3
bar-progress-empty-foreground = #44

[module/xwindow]
type = internal/xwindow
format = <label>
label = %title%
label-maxlen = 75

[module/i3]
type = internal/i3
strip-wsnumbers = true
wrapping-scroll = false
pin-workspaces = true
index-sort = true

ws-icon-0 = 0;一
ws-icon-1 = 1;二
ws-icon-2 = 2;三
ws-icon-3 = 3;四
ws-icon-4 = 4;五
ws-icon-5 = 5;六
ws-icon-6 = 6;七
ws-icon-7 = 7;八
ws-icon-8 = 8;知
ws-icon-9 = 9;音
ws-icon-10 = 10;壹
ws-icon-11 = 11;貳
ws-icon-12 = 12;參
ws-icon-13 = 13;肆
ws-icon-14 = 14;伍
ws-icon-15 = 15;陸
ws-icon-16 = 16;柒
ws-icon-17 = 17;捌
ws-icon-18 = 18;玖
ws-icon-19 = 19;拾
ws-icon-20 = 20;1
ws-icon-21 = 21;2
ws-icon-22 = 22;3
ws-icon-23 = 23;4
ws-icon-24 = 24;5
ws-icon-25 = 25;6
ws-icon-26 = 26;7
ws-icon-27 = 27;8
ws-icon-28 = 28;9
ws-icon-29 = 29;10

label-mode = [%mode%]
label-mode-padding = 1

label-focused =%icon%
label-focused-padding = 1
label-focused-foreground = ${color.focused}
label-focused-background = ${color.background}
label-focused-overline = ${color.focused}
;label-focused-underline = ${color.border-bottom}

label-unfocused =%icon%
label-unfocused-padding = 1

label-visible =%icon%
label-visible-padding = 1

label-urgent =%icon%
label-urgent-padding = 1
label-urgent-background = ${color.background}
label-urgent-foreground = ${color.urgent}


;Labels for debugging i3
;label-focused =(%index%;%name%;%icon%)
;label-unfocused =(%index%;%name%;%icon%)
;label-visible =(%index%;%name%;%icon%)
;label-urgent =(%index%;%name%;%icon%)

[module/wifi]
type = internal/network
interface = wlp3s0
interval = 1.0
format-connected = <label-connected>
label-connected = %downspeed:8:8%
;format-connected = <ramp-signal> <label-connected>
;label-connected = %essid%
format-disconnected =  NO WIFI

ramp-signal-0 = 

[module/cpu]
type = internal/cpu
label = %percentage:2:2%%
interval = 2
format-prefix = ""

[module/memory]
type = internal/memory
interval = 2
label = %mb_used:10:10%
format-prefix = ""


[module/battery]
type = internal/battery
full-at = 97
time-format = %H:%M
battery = BAT0
adapter = AC

format-charging = <animation-charging> <label-charging>
label-charging = %percentage%% (%time%)

format-discharging = <ramp-capacity> <label-discharging>
label-discharging = %percentage%% (%time%)

format-full = <label-full>
format-full-prefix = " "

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
animation-charging-framerate = 750


[module/pulseaudio]
type = internal/pulseaudio
;master-mixer　= Master
;speaker-mixer = Speaker
;headphone-mixer = Headphone
;headphone-id = 21
mapped = true

format-volume = <ramp-volume><label-volume>
label-volume = %percentage:2:3%%

label-muted = ""

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 

;ramp-headphones-0 = 
;ramp-headphones-1 = 
;ramp-headphones-2 = 

[module/date]
type = internal/date
interval = 30
label =  %time%
time =  %H:%M
time-alt =  %Y-%m-%d
