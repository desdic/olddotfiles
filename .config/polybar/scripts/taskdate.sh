#!/bin/bash

TASK="/usr/bin/task"
OVERDUE=" "
DUETODAY=" "

if [ -f "/tmp/imapsyncicon_$USER" ]; then
        SYNC="%{F#2F343F}%{B#70ACB7}  %{B-}%{F-}"
      else
        SYNC="%{F#2F343F}%{B#70ACB7}  %{B-}%{F-}"
fi

FORMAT=$(LC_TIME=en_US.UTF-8 /usr/bin/date +"%V - %A %e %B %Y - %H:%M")

A="%{F#70ACB7}%{B#2F343F}%{B-}%{F-}${SYNC}"
B=" %{B-}%{F-}%{F#627D82}%{B#70ACB7}%{F#fff}%{B#627D82}Week ${FORMAT}   %{B-}%{F-}"

if [ "$($TASK +READY +OVERDUE count)" -gt 0 ]; then
  echo "${A}%{F#cd1f3f}%{B#70ACB7}${OVERDUE}${B}"
elif [ "$($TASK +DUETODAY count)" -gt 0 ]; then
  echo "${A}%{F#a3c725}%{B#70ACB7}${DUETODAY}${B}"
else
  echo "${A}%{F#2F343F}%{B#70ACB7}${DUETODAY}${B}"
fi



