#!/usr/bin/bash

if ! pidof i3 >/dev/null 2>&1; then
  exit 1
fi

#files=(~/Pictures/wallpapers/*)
#WALLPAPER=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
##WALLPAPER2=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
#
#while [ ! -e "$WALLPAPER"  ]; 
#do
#  WALLPAPER=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
#done
#
##while [ ! -e "$WALLPAPER2"  ]; 
##do
##  WALLPAPER2=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
##done
#
##/usr/bin/feh -B white --bg-fill "$WALLPAPER" --bg-fill "$WALLPAPER2"
#/usr/bin/feh -B white --bg-fill "$WALLPAPER"
/usr/bin/feh -B white --randomize --bg-fill ~/Pictures/wallpapers/*
