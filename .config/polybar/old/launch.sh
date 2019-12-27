#!/usr/bin/env bash

kill $(pidof polybar) >/dev/null

while pidof polybar > /dev/null; do sleep 1; done

readarray -t mirrors < <(xrandr --query | grep " connected" | grep -Eo '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+')
if (( ${#mirrors[@]} == 2 )) && [[ "${mirrors[0]}" != "" && "${mirrors[0]}" == "${mirrors[1]}" ]]; then
    m=$(polybar -m|cut -d: -f1)
    MONITOR=$m polybar --reload bottombar-i3-mirror -c ~/.config/polybar/config &
    MONITOR=$m polybar --reload topbar-i3 -c ~/.config/polybar/config &
    exit 0
fi

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload bottombar-i3 -c ~/.config/polybar/config &
    MONITOR=$m polybar --reload topbar-i3 -c ~/.config/polybar/config &
  done
else
  polybar --reload bottombar-i3 -c ~/.config/polybar/config &
  polybar --reload topbar-i3 -c ~/.config/polybar/config &
fi
