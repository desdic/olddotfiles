#!/bin/sh

[ ! -x /usr/bin/tmux ] && exit 1

if /usr/bin/tmux ls|grep -q work:; then
  /usr/bin/tmux new-window -t work
else
  #LANG=da_DK.UTF-8 /usr/bin/st -- /usr/bin/tmux new-session -s work
  LANG=da_DK.UTF-8 /usr/bin/urxvt -e /usr/bin/tmux new-session -s work
fi


