#!/bin/bash

xset r rate 300 50
xset s on
xset s 600
xkbcomp -w0 -I"$HOME/.xkb" -R"$HOME/.xkb" keymap/custom "$DISPLAY"
