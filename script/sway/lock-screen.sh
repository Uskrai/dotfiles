#!/bin/sh -e

DIRNAME=$(dirname ${BASH_SOURCE})
swaymsg workspace number 1 && sleep 0.5 && ${DIRNAME}/lock-screen-swaylock.sh
# sleep 1
# ~/script/lock-screen-with-i3lock.sh

