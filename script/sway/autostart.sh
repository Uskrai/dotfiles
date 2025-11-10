#!/bin/sh
~/script/common-autostart.sh > ~/script/autostart-log

ydotoold &

# joystickwake --loglevel info --command "ydotool key 125:0" --cooldown 30 > $HOME/script/log/joystickwake.log &

