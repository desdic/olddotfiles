#!/usr/bin/env sh

kill $(pidof polybar) >/dev/null

while pidof polybar > /dev/null; do sleep 1; done

#count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
  done
else
  polybar --reload mainbar-i3 -c ~/.config/polybar/config &
fi
