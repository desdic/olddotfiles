#!/bin/bash

/usr/bin/pkill -f .config/compton.conf ||  /usr/bin/compton -b --backend glx --vsync opengl-swc --config ~/.config/compton.conf
