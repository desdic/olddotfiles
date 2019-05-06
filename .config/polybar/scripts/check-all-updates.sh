#!/bin/sh
#source https://github.com/x70b1/polybar-scripts

EDITOR=/usr/bin/vim
export EDITOR

#if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
#    updates_arch=0
#fi

# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
#if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
if ! updates_aur=$(/usr/bin/pacaur -Qu 2>/dev/null | /usr/bin/wc -l); then
    updates_aur=0
fi

#updates=$(("$updates_arch" + "$updates_aur"))
updates=$updates_aur

if [ "$updates" -gt 0 ]; then
    echo " $updates"
else
    echo "0"
fi
