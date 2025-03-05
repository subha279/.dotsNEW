#!/bin/sh

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.dots/Scripts/Bar/bar_themes/colors

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$white^ ^b$black^  $get_capacity%% 󰁹 "
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$white^ ^b$black^ 󰤨 ^d^%s" " ^c$white^Connected" ;;
	down) printf "^c$white^ ^b$black^ 󰤭 ^d^%s" " ^c$white^Disconnected" ;;
	esac
}

clock() {
	printf "^c$white^ ^b$black^ 󱑆 "
	printf "^c$white^^b$black^ $(date '+%I:%M %p')"
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(clock) $(wlan) $(battery)"
done
