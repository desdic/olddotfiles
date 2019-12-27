#!/bin/sh

player_status=$(playerctl -p spotify status 2> /dev/null)
artist=$(playerctl -p spotify metadata artist 2> /dev/null)
title=$(playerctl -p spotify metadata title 2> /dev/null)
meta="${artist} - ${title}"

if [ "$player_status" = "Playing" ]; then
    # echo "%{B#61C766}%{F#1C1E20}  %{B#C4C7C5}%{F#4C5260} ${meta} "
    echo " %{F#61C766}  %{F#f5f5f5}${meta} "
elif [ "$player_status" = "Paused" ]; then
    #echo "%{B#EBD369}%{F#1C1E20}  %{B#C4C7C5}%{F#4C5260} ${meta} "
    echo " %{F#EBD369}  %{F#f5f5f5}${meta} "
else
    echo ""
fi
