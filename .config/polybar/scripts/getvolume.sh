#!/bin/bash

VOL=$(/sbin/pamixer --get-volume)
MUTE=$(/sbin/pamixer --get-mute)

MICON=""
if [ "${MUTE}" == "false" ]; then
  MICON=""
fi

echo "${MICON} ${VOL}%"
