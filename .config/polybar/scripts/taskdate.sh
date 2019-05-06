#!/bin/bash

TASK="/usr/bin/task"
OVERDUE=""
DUETODAY=""

FORMAT=$(/usr/bin/date +"%V - %A %e %B %Y - %H:%M")


#    URGENCOUNT=`$TASK +READY urgency > 10 count`
#    if [ -z "$URGENCOUNT" ]; then
#        URGENCOUNT=0
#    fi

if [ "$($TASK +READY +OVERDUE count)" -gt 0 ]; then
  echo "%{F#fe0000}${OVERDUE}%{F-} Week ${FORMAT}"
elif [ "$($TASK +DUETODAY count)" -gt 0 ]; then
  echo "%{F#c1941a}${DUETODAY}%{F-} Week ${FORMAT}"
else
  echo "%{F#c1941a}${DUETODAY}%{F-} Week ${FORMAT}"
fi



