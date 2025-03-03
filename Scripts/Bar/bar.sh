#!/bin/sh

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.dots/Scripts/Bar/bar_themes/gruvbox

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$black^ ^b$green^  $get_capacity%% 󰁹 "
}

wlan() {
	case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
	up) printf "^c$black^ ^b$green^ 󰤨 ^d^%s" " ^c$green^Connected" ;;
	down) printf "^c$black^ ^b$green^ 󰤭 ^d^%s" " ^c$green^Disconnected" ;;
	esac
}

clock() {
	printf "^c$black^ ^b$green^ 󱑆 "
	printf "^c$black^^b$green^ $(date '+%I:%M %p')"
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ]
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(clock) $(wlan) $(battery)"
done
