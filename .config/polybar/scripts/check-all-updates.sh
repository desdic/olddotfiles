#!/bin/sh

EDITOR=/usr/bin/vim
export EDITOR

/sbin/yay -Sya > /dev/null 2>&1
if ! updates_aur=$(/sbin/yay -Qu 2>/dev/null | /usr/bin/wc -l); then
    updates_aur=0
fi

updates=$updates_aur
if [ "$updates" -gt 0 ]; then
    #echo "%{B#75A4CD}%{F#1C1E20}  %{B#C4C7C5}%{F#1C1E20} $updates %{B#2f343f}%{F#2f343f}|"
    #echo " $updates"
    echo "💫 $updates"
else
    echo ""
fi
