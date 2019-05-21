#!/bin/bash

TASK="/usr/bin/task"
OVERDUE=""
DUETODAY=""

if [ -f "/tmp/imapsyncicon_$USER" ]; then
        SYNC="%{F#2F343F}%{B#F0DD74}  %{B-}%{F-}"
      else
        SYNC="%{F#2F343F}%{B#F0DD74}  %{B-}%{F-}"
fi

FORMAT=$(/usr/bin/date +"%V - %A %e %B %Y - %H:%M")

if [ "$($TASK +READY +OVERDUE count)" -gt 0 ]; then
  echo "%{F#F0DD74}%{B#2F343F}%{B-}%{F-}${SYNC}%{F#cd1f3f}%{B#F0DD74}${OVERDUE} %{B-}%{F-}%{F#ABA167}%{B#F0DD74}%{F#000}%{B#ABA167}Week ${FORMAT} %{B-}%{F-}"
elif [ "$($TASK +DUETODAY count)" -gt 0 ]; then
  echo "%{F#F0DD74}%{B#2F343F}%{B-}%{F-}${SYNC}%{F#a3c725}%{B#F0DD74}${DUETODAY} %{B-}%{F-}%{F#ABA167}%{B#F0DD74}%{F#000}%{B#ABA167}Week ${FORMAT} %{B-}%{F-}"
else
  echo "%{F#F0DD74}%{B#2F343F}%{B-}%{F-}${SYNC}%{F#2F343F}%{B#F0DD74}${DUETODAY} %{B-}%{F-}%{F#ABA167}%{B#F0DD74}%{F#000}%{B#ABA167}Week ${FORMAT} %{B-}%{F-}"
fi



