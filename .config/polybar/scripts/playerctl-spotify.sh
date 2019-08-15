#!/bin/sh

player_status=$(playerctl -p spotify status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "%{F#1ed761}%{F#4C5260} $(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "%{F#bfc900}%{F#4C5260} $(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title)"
else
    echo ""
fi
