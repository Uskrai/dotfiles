#!/bin/bash
# this file is to be used with symlink
WM=sway

NAME=$(basename $0);

echo $HOME/script/$WM/$NAME >> ~/script/dynamic-wm.log
~/script/$WM/$NAME;

