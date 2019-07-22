#!/bin/bash

case $(i3-msg -t get_tree | jq --raw-output 'recurse(.nodes[]; .nodes != null) | select(.nodes[].focused).layout') in
  splith) echo h ;;
  splitv) echo v ;;
  tabbed) echo t ;;
  stacked) echo s ;;
esac
