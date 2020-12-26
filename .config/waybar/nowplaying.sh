#!/usr/bin/env bash

set -euo pipefail

state=$(playerctl metadata --format '{{playerName}}: {{title}} by {{artist}}')
player_status=$(playerctl -a status)

if [[ "$player_status" =~ "Playing" ]]; then
    printf " %s" "$state"  2>/dev/null
elif [[ "$player_status" =~ "Paused" ]]; then
    printf " %s" "$state"  2>/dev/null
else
    printf "$player_status"
fi
