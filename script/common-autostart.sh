#!/bin/sh
echo "calling common-autostart" >> ~/script/dynamic-wm.log
dunst &

# applet
blueman-applet &
nm-applet &

# steam -silent &
# discord --start-minimized &

# ibus-daemon --daemonize --xim

# pulseaudio &!
~/script/change-wallpaper.sh

# gnome-keyring-daemon --start --daemonize --components=secrets,ssh,pcks11 &
dbus-update-activation-environment --all &

input-remapper-control --command autoload > ~/script/common-autostart.log

aria2c --enable-rpc --rpc-listen-all --rpc-secret 6d9d9c41-9d82-4986-9e0c-6aa364167a42 &!
