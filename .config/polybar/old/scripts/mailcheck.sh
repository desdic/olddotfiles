#!/bin/sh

if [ -f "/tmp/imapsyncicon_$USER" ]; then
        SYNC="%{B#404040}%{F#FFFFFF} "
      else
        SYNC="%{B#404040}%{F#FFFFFF} "
fi

echo "${SYNC}"
