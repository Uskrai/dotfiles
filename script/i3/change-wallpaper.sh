#!/bin/zsh

export DISPLAY=:0
export XAUTHORITY=$HOME/.Xauthority
export XDG_RUNTIME_DIR=/run/user/1002


# OWO=$(find $HOME/.wallpaper -type f | shuf -n1)
# echo $OWO
nitrogen --set-zoom-fill --random ~/.wallpaper/ --save
# pcmanfm -w $(find $HOME/.wallpaper -type f | shuf -n1 )
# echo changed at $(date) >> $HOME/script/change_wallpaper.log
