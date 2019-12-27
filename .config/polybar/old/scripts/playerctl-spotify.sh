#!/bin/sh

player_status=$(playerctl -p spotify status 2> /dev/null)
artist=$(playerctl -p spotify metadata artist 2> /dev/null)
title=$(playerctl -p spotify metadata title 2> /dev/null)
meta="${artist} - ${title}"

if [ "$player_status" = "Playing" ]; then
    echo "%{F#1ed761}  %{F#4C5260} ${meta}"
elif [ "$player_status" = "Paused" ]; then
    echo "%{F#bfc900}  %{F#404040} ${meta}"
else
    echo ""
fi
