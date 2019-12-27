#!/bin/bash
exit 0
#/usr/bin/pkill -f .config/compton.conf ||  /usr/bin/compton -b --backend glx --config ~/.config/compton.conf
/usr/bin/pkill -f .config/picom.conf ||  /sbin/picom -b -C --backend glx --config ~/.config/picom.conf
