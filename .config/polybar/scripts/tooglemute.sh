#!/bin/bash

sinks=$(pamixer --list-sink | grep ^[0-9] | awk '{print $1}' | xargs)

for x in $sinks; do
    pamixer --sink $x -t ;
done
