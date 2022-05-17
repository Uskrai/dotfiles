#!/bin/zsh

export WAYLAND_DISPLAY=wayland-0
export XAUTHORITY=/home/uskrai/.Xauthority
export XDG_RUNTIME_DIR=/run/user/1000

IMAGE=~/.wallpaper/$(ls ~/.wallpaper | shuf -n 1)

setwallpaper $IMAGE
# kill -9 $(pidof swaybg)
#
# WAYLAND_DISPLAY=wayland-2 swaybg --image ~/.wallpaper/$(ls ~/.wallpaper | shuf -n 1) &
