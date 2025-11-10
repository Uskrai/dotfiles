#!/bin/bash

ACTIVE_WINDOW_ID=$(xprop -root | awk '/NET_ACTIVE_WINDOW/ {print $5; exit}');
ACTIVE_WINDOW_CLASS=$(xprop -id $ACTIVE_WINDOW_ID | awk -F\" '/WM_CLASS/ {print $2; exit}')

declare -A arr=(
    ['kitty']=1
)

log="$HOME/script/kill.log"

echo $ACTIVE_WINDOW_ID >> $log
echo $ACTIVE_WINDOW_CLASS >> $log
# echo ${arr[$ACTIVE_WINDOW_CLASS]} >> $log
echo test >> $log
swaymsg kill;
