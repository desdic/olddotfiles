#!/bin/sh

pacmd list-sinks | grep -A50 '* index:'|grep 'description'|cut -d\" -f2
