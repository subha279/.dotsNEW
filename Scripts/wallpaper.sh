#!/bin/sh
wall=$(find ~/Wallpaper/ -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)
xwallpaper --zoom $wall
wal -c
wal -i $wall
xdotool key super+control+shift+q
