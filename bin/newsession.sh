#!/bin/sh

TMUX=/usr/bin/tmux

[ ! -x ${TMUX} ] && exit 1

LANG=da_US.UTF-8

RES=$(${TMUX} ls -F "#{session_name}_#{?session_attached,attached,not_attached}"|grep ^work_)

case ${RES} in
  work_attached)
    LANG=da_US.UTF-8 /usr/bin/st -n work -- ${TMUX} new-window -t work
    #LANG=da_US.UTF-8 /sbin/alacritty --class work -e ${TMUX} new-window -t work
    ;;
  work_not_attached)
    LANG=da_US.UTF-8 /usr/bin/st -n work -- ${TMUX} attach -t work
    #LANG=da_US.UTF-8 /sbin/alacritty --class work -e ${TMUX} attach -t work
    ;;
  *)
    ${TMUX} new-session -s work -d
    LANG=da_US.UTF-8 /usr/bin/st -n work -- ${TMUX} attach -t work
    #LANG=da_US.UTF-8 /sbin/alacritty --class work -e ${TMUX} attach -t work
    ;;
esac
#if /usr/bin/tmux ls|grep -q work:; then
#  /usr/bin/tmux new-window -t work
#else
#  #LANG=da_US.UTF-8 /usr/bin/st -n work -- /usr/bin/tmux new-session -s work
#  LANG=da_US.UTF-8 /sbin/alacritty -e /usr/bin/tmux new-session -s work
#  #LANG=da_DK.UTF-8 /usr/bin/urxvt -name work -e /usr/bin/tmux new-session -s work
#  #LANG=da_DK.UTF-8 /sbin/st -n work -e /usr/bin/tmux new-session -s work
#  #LANG=da_DK.UTF-8 /sbin/termite -e '/usr/bin/tmux new-session -s work'
#  #LANG=da_DK.UTF-8 /sbin/kitty --class kittywork sh -c '/usr/bin/tmux new-session -s work'
#fi
