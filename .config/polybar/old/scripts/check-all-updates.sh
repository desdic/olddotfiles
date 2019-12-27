#!/bin/sh

EDITOR=/usr/bin/vim
export EDITOR

/sbin/yay -Sya > /dev/null 2>&1
if ! updates_aur=$(/sbin/yay -Pu 2>/dev/null | /usr/bin/wc -l); then
    updates_aur=0
fi

updates=$updates_aur
if [ "$updates" -gt 0 ]; then
    echo "%{B#404040}%{F#009105}%{F-}%{B#009105} $updates   %{B#009105}%{F#404040}"
else
    echo "%{B#404040}%{F#627D82}%{F-}%{B#627D82} 0   %{B#627D82}%{F#404040}"
fi
