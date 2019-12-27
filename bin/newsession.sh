#!/bin/sh

[ ! -x /usr/bin/tmux ] && exit 1

if /usr/bin/tmux ls|grep -q work:; then
  /usr/bin/tmux new-window -t work
else
  LANG=da_US.UTF-8 /usr/bin/st -n work -- /usr/bin/tmux new-session -s work
  #LANG=da_DK.UTF-8 /usr/bin/urxvt -name work -e /usr/bin/tmux new-session -s work
  #LANG=da_DK.UTF-8 /sbin/st -n work -e /usr/bin/tmux new-session -s work
  #LANG=da_DK.UTF-8 /sbin/termite -e '/usr/bin/tmux new-session -s work'
  #LANG=da_DK.UTF-8 /sbin/kitty --class kittywork sh -c '/usr/bin/tmux new-session -s work'
fi
