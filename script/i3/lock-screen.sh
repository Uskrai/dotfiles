#!/bin/sh -e

DIRNAME=$(dirname ${BASH_SOURCE})
i3-msg workspace number 1 && sleep 0.5 && ${DIRNAME}/lock-screen-with-i3lock.sh
# sleep 1
# ~/script/lock-screen-with-i3lock.sh

