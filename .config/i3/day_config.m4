include(./common_config.m4)

define(color_settings, [[
# Color
set $cbg "#f26262"
set $ccolor "#efebe0"
set $cunfo "#cb8b8b"
set $cindi "#145ba7"
set $cindiu "#8a9db1"
#set $cbg "#e04040"

#<colorclass>           <border> <background> <text>  <indicator> <child_border>
client.focused          $cbg     $cbg         $ccolor $cindi      $cbg
client.focused_inactive $cbg     $cunfo       $ccolor $cindiu     $cunfo
client.unfocused        $cbg     $cunfo       $ccolor $cindiu     $cunfo
client.urgent           $cbg     $cunfo       $ccolor $cindi      $cunfo
]])
color_settings()
