#!/bin/bash

sinks=$(pamixer --list-sink | grep "^[0-9]" | awk '{print $1}' | xargs)

case "$1" in
  "up")
    for x in $sinks; do
        pamixer --sink $x -i 5 --allow-boost;
    done
    ;;
  "down")
    for x in $sinks; do
        pamixer --sink $x -d 5 --allow-boost;
    done
    ;;
  *)
    ;;
esac
