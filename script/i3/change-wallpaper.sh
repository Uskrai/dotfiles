#!/bin/zsh

export DISPLAY=:0
export XAUTHORITY=/home/uskrai/.Xauthority
export XDG_RUNTIME_DIR=/run/user/1002


# OWO=$(find /home/uskrai/.wallpaper -type f | shuf -n1)
# echo $OWO
nitrogen --set-zoom-fill --random ~/.wallpaper/ --save
# pcmanfm -w $(find /home/uskrai/.wallpaper -type f | shuf -n1 )
# echo changed at $(date) >> /home/uskrai/script/change_wallpaper.log
