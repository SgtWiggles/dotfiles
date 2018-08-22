changequote(`[[',`]]')

define(i3_settings, [[
# General
set $mod Mod4
font pango:Misc Termsyn,Noto Sans Mono CJK JP, FontAwesome, Material Icons
focus_follows_mouse  yes
floating_modifier $mod
workspace_auto_back_and_forth yes

## Gaps
gaps inner 10
gaps outer 0
smart_gaps on
smart_borders on
new_window pixel 1

mode "props" {
	bindsym n "exec python3 ~/.config/color-changer/color-changer.py night && i3-msg mode default"
	bindsym d "exec python3 ~/.config/color-changer/color-changer.py day && i3-msg mode default"

	bindsym Escape mode "default"
	bindsym Return mode "default"
}

## Specific window
for_window [window_role="pop-up|bubble|task_dialog|Preferences"] floating enable
for_window [window_type="dialog|menu"] floating enable
for_window [window_role="browser|GtkFileChooserDialog"] resize set 800 600, move position center
assign [window_role="browser"] 8
for_window [class="(?i)pavucontrol|lxappearance|xarchiver|kamus"] floating enable

# Startup
exec --no-startup-id "bash -c '~/.config/start.sh'"
exec --no-startup-id "python3 '~/.config/color-changer/color-changer.py'"
]])



define(common_bindings, [[
## Quick Launch
bindsym $mod+Return exec ume
bindsym $mod+Shift+Return exec sakura
bindsym $mod+d exec --no-startup-id "rofi -show run"
bindsym $mod+Pause exec "~/.config/lock.sh"
bindsym $mod+p mode "props"


## Music player launch!
#bindsym $mod+m  [instance="ncmpcpp"] exec "~/.config/ncmpcpp_start.sh"; scratchpad show
#bindsym $mod+m exec "ume -x ~/go/bin/pms"
bindsym $mod+m exec "ume -x ncmpcpp"


## Window Focus (vim)
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

## Window Move
bindsym $mod+Shift+h move left 30px
bindsym $mod+Shift+j move down 30px
bindsym $mod+Shift+k move up 30px
bindsym $mod+Shift+l move right 30px

## Window Resize
bindsym $mod+Mod1+h resize shrink width 30 px or 10 ppt
bindsym $mod+Mod1+j resize shrink height 30 px or 10 ppt
bindsym $mod+Mod1+k resize grow height 30 px or 10 ppt
bindsym $mod+Mod1+l resize grow width 30 px or 10 ppt

bindsym $mod+Shift+Mod1+h resize shrink width 10 px or 1 ppt
bindsym $mod+Shift+Mod1+j resize shrink height 10 px or 1 ppt
bindsym $mod+Shift+Mod1+k resize grow height 10 px or 1 ppt
bindsym $mod+Shift+Mod1+l resize grow width 10 px or 1 ppt
#
## Tiling
bindsym $mod+y split h
bindsym $mod+u split v
bindsym $mod+g split toggle
bindsym $mod+f fullscreen
bindsym $mod+s layout stacking
bindsym $mod+t layout tabbed
bindsym $mod+e layout toggle split
bindsym $mod+Shift+space floating toggle
bindsym $mod+space focus mode_toggle

bindsym $mod+q kill
bindsym $mod+minus move scratchpad
bindsym $mod+equal scratchpad show

## Misc
bindsym $mod+Shift+C reload
bindsym $mod+Shift+R exec "i3-msg restart; ~/.config/reload.sh"
bindsym $mod+Shift+e exit
bindsym Print exec "maim -u -s -n -l -c 0.157,0.333,0.466,0.4 ~/Pictures/scrots-$(date -Iseconds | cut -d'+' -f1).png"
bindsym Mod4+Print exec "maim -u -s -n -l -c 0.157,0.333,0.466,0.4 | xclip -selection clipboard -t image/png"

## Audio
bindsym XF86AudioLowerVolume exec "~/.config/volume_down.sh"
bindsym XF86AudioRaiseVolume exec "~/.config/volume_up.sh"
bindsym XF86AudioMute exec --no-startup-id "pamixer -t"

bindsym XF86AudioPrev exec "mpc prev"
bindsym XF86AudioNext exec "mpc next"
bindsym XF86AudioPlay exec "mpc toggle"


## Brightness
bindsym XF86KbdBrightnessUp exec "xbacklight -inc 10"
bindsym XF86KbdBrightnessDown exec  "xbacklight -dec 10"
bindsym XF86MonBrightnessUp exec "xbacklight -inc 10"
bindsym XF86MonBrightnessDown exec "xbacklight -dec 10"

#Quick laumch firefox and move
bindsym $mod+Shift+b "exec --no-startup-id firefox"
bindsym $mod+b workspace 8
]])


divert(-1)
# forloop(i, from, to, stmt)
	define([[forloop]], [[pushdef([[$1]], [[$2]])_forloop([[$1]], [[$2]], [[$3]], [[$4]])popdef([[$1]])]])
define([[_forloop]],
		[[$4[[]]ifelse($1, [[$3]], ,
			[[define([[$1]], incr($1))_forloop([[$1]], [[$2]], [[$3]], [[$4]])]])]])
	divert


#generate_workspace_binds(prefix)
define(generate_workspace_binds, [[
	ifelse($1, [[0]],  [[
bindsym $mod+1 workspace 0
bindsym $mod+2 workspace 1
bindsym $mod+3 workspace 2
bindsym $mod+4 workspace 3
bindsym $mod+5 workspace 4
bindsym $mod+6 workspace 5
bindsym $mod+7 workspace 6
bindsym $mod+8 workspace 7
bindsym $mod+9 workspace 8
bindsym $mod+0 workspace 9
bindsym $mod+Shift+1 move container to workspace 0
bindsym $mod+Shift+2 move container to workspace 1
bindsym $mod+Shift+3 move container to workspace 2
bindsym $mod+Shift+4 move container to workspace 3
bindsym $mod+Shift+5 move container to workspace 4
bindsym $mod+Shift+6 move container to workspace 5
bindsym $mod+Shift+7 move container to workspace 6
bindsym $mod+Shift+8 move container to workspace 7
bindsym $mod+Shift+9 move container to workspace 8
bindsym $mod+Shift+0 move container to workspace 9
	]],[[
bindsym $mod+1 workspace [[]]$1[[]]0
bindsym $mod+2 workspace [[]]$1[[]]1
bindsym $mod+3 workspace [[]]$1[[]]2
bindsym $mod+4 workspace [[]]$1[[]]3
bindsym $mod+5 workspace [[]]$1[[]]4
bindsym $mod+6 workspace [[]]$1[[]]5
bindsym $mod+7 workspace [[]]$1[[]]6
bindsym $mod+8 workspace [[]]$1[[]]7
bindsym $mod+9 workspace [[]]$1[[]]8
bindsym $mod+0 workspace [[]]$1[[]]9
bindsym $mod+Shift+1 move container to workspace [[]]$1[[]]0
bindsym $mod+Shift+2 move container to workspace [[]]$1[[]]1
bindsym $mod+Shift+3 move container to workspace [[]]$1[[]]2
bindsym $mod+Shift+4 move container to workspace [[]]$1[[]]3
bindsym $mod+Shift+5 move container to workspace [[]]$1[[]]4
bindsym $mod+Shift+6 move container to workspace [[]]$1[[]]5
bindsym $mod+Shift+7 move container to workspace [[]]$1[[]]6
bindsym $mod+Shift+8 move container to workspace [[]]$1[[]]7
bindsym $mod+Shift+9 move container to workspace [[]]$1[[]]8
bindsym $mod+Shift+0 move container to workspace [[]]$1[[]]9
	]])
]])

define(WORKSPACE_NAME, M)
#generate_workspace_set(number, max)
define(generate_workspace_set, [[
ifelse([[$1]], [[0]], [[]],[[mode "[[]]WORKSPACE_NAME[[]]$1" {]])
generate_workspace_binds($1)
common_bindings()
bindsym $mod+Tab mode "ifelse(eval($1 + 1), eval($2 + 1), [[default]], [[WORKSPACE_NAME[[]]eval($1 + 1)]])"
bindsym $mod+Shift+Tab mode "ifelse(eval($1 - 1), [[0]], [[default]], [[WORKSPACE_NAME[[]]eval($1 - 1)]])"
ifelse([[$1]], [[0]], ,[[}]])
]])

i3_settings()
forloop(i,[[0]],[[1]], [[generate_workspace_set(i, 1)]])
