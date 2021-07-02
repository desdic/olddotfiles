#!/bin/bash

#xset r rate 760 35
#xset r rate 600 60
#xset r rate 500 25
#xset r rate 400 50
xset s on
xset s 600
#xkbset repeatkeys rate 600 25
#xkbset bouncekeys 70
#xkbset repeatkeys rate 400 25
xkbset repeatkeys rate 600 25
xkbcomp -w0 -I"$HOME/.xkb" -R"$HOME/.xkb" keymap/custom "$DISPLAY" >/dev/null 2>&1
