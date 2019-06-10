#!/bin/sh

if [ -f "/tmp/imapsyncicon_$USER" ]; then
        SYNC=" "
      else
        SYNC=" "
fi

echo "${SYNC}"
