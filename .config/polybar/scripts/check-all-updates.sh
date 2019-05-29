#!/bin/sh

EDITOR=/usr/bin/vim
export EDITOR

/sbin/yay -Sya > /dev/null 2>&1
if ! updates_aur=$(/sbin/yay -Qu 2>/dev/null | /usr/bin/wc -l); then
    updates_aur=0
fi

updates=$updates_aur

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo "0"
fi
