#!/bin/sh
echo "calling common-autostart" >> ~/script/dynamic-wm.log
dunst &

# applet
blueman-applet &
nm-applet &

# steam -silent &
discord --start-minimized &

ibus-daemon --daemonize --xim

# pulseaudio &!
~/script/change-wallpaper.sh
