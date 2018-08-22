#! /bin/bash
m4 ./day_config.m4 > day_config 
m4 ./night_config.m4 > night_config 
cat night_config > config
polybar-msg cmd restart
