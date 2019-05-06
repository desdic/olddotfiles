#!/bin/bash

/usr/bin/pkill -f .config/compton.conf ||  /usr/bin/compton -b --backend glx --config ~/.config/compton.conf
