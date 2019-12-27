#!/bin/bash

TASK="/usr/bin/task"
OVERDUE=""
DUETODAY=""

FORMAT=$(LC_TIME=en_US.UTF-8 /usr/bin/date +"%V - %A %e %B %Y - %H:%M")

B=" Week ${FORMAT}   "

if [ "$($TASK +READY +OVERDUE count)" -gt 0 ]; then
  echo "%{F#292929}%{B#292929}%{F#404040}%{B#404040} %{F#ff002e}${DUETODAY}%{F-}${B}"
elif [ "$($TASK +DUETODAY count)" -gt 0 ]; then
  echo "%{F#292929}%{B#292929}%{F#404040}%{B#404040} %{F#bfc900}${DUETODAY}%{F-}${B}"
else
  #echo "%{F#FFF}${DUETODAY}%{F-}${B}"
  echo "%{F#292929}%{B#292929}%{F#404040}%{B#404040} %{F#FFF}${DUETODAY}%{F-}${B}"
fi
