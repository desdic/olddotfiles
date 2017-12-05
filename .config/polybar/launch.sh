#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

for m in eDP1 DP1 DP2 HDMI3 HDMI1
do
    MONITOR=${m} polybar top &
    MONITOR=${m} polybar bottom &
done

echo "Bars launched..."
