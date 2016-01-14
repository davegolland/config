#!/bin/bash
active_window=`xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f2`
win_class=`wmctrl -lx | sed s/0x0/0x/ | grep $active_window | sed "s/\s\+/ /" | cut -d' ' -f3`


# get list of all windows matching with the class above
win_list=$(wmctrl -x -l | grep -i $win_class | awk '{print $1}' )

# get id of the focused window
active_win_id=$(xprop -root | grep '^_NET_ACTIVE_W' | awk -F'# 0x' '{print $2}')
if [ "$active_win_id" == "0" ]; then
  active_win_id=""
fi

# get next window to focus on, removing id active
switch_to=$(echo $win_list | sed s/.*$active_win_id// | awk '{print $1}')

# if the current window is the last in the list ... take the first one
if [ "$switch_to" == '' ];then
  switch_to=$(echo $win_list | awk '{print $1}')
fi

# switch to window
wmctrl -i -a $switch_to
