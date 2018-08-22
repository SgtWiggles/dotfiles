include(./common_config.m4)

define(color_settings, [[

set $cbg  "#673ab7"
set $ccolor  "#eeeeff"
set $cunfo  "#502c8c"
set $cindiu "#673ab7"
set $cindi  "#ae80ff"

#<colorclass>           <border> <background> <text>  <indicator> <child_border>
client.focused          $cbg     $cbg         $ccolor $cindi      $cbg
client.focused_inactive $cbg     $cunfo       $ccolor $cindiu     $cunfo
client.unfocused        $cbg     $cunfo       $ccolor $cindiu     $cunfo
client.urgent           $cbg     $cunfo       $ccolor $cindi      $cunfo
]])
color_settings()
