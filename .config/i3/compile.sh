#!/usr/bin/env bash
m4  ./day_config.m4 > day_config &&
m4  ./night_config.m4 > night_config &&
cat night_config > config
i3-msg reload
