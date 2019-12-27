#!/usr/bin/env bash

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar -c ~/.config/polybar/config.ini main &

readarray -t mirrors < <(xrandr --query | grep " connected" | grep -Eo '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+')
if (( ${#mirrors[@]} == 2 )) && [[ "${mirrors[0]}" != "" && "${mirrors[0]}" == "${mirrors[1]}" ]]; then
    m=$(polybar -m|cut -d: -f1)
    MONITOR=$m polybar --reload -c ~/.config/polybar/config.ini main &
    #MONITOR=$m polybar --reload topbar-i3 -c ~/.config/polybar/config &
    exit 0
fi

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload -c ~/.config/polybar/config.ini main &
    #MONITOR=$m polybar --reload topbar-i3 -c ~/.config/polybar/config &
  done
else
  polybar --reload -c ~/.config/polybar/config.ini main &
  # polybar --reload topbar-i3 -c ~/.config/polybar/config &
fi

