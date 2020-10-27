#!/bin/bash

TASK="/usr/bin/task"
OVERDUE=""
#OVERDUE="🗓"
#DUETODAY="🗓"
DUETODAY=""
#OK="🗓"
OK=""

#FORMAT=$(LC_TIME=en_US.UTF-8 /usr/bin/date +"%V - %A %e %B %Y - %H:%M")
FORMAT=$(/usr/bin/date +"%a %d/%m/%Y - %H:%M")

#B=" Week ${FORMAT} "
B=" ${FORMAT} "

if [ "$($TASK +READY +OVERDUE count)" -gt 0 ]; then
  echo "%{F#e53935}${OVERDUE}%{F#f5f5f5}${B}"
elif [ "$($TASK +DUETODAY count)" -gt 0 ]; then
  echo "%{F#EBD369}${DUETODAY}%{F#f5f5f5} ${B}"
else
  echo "${OK}${B}"
fi
