#!/bin/sh -e

LOGFILE=$HOME/script/lock-screen.log

log ()
{
  DATE=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[$DATE] $1" >> $LOGFILE
}

log "lock screen called"

DIRNAME=$(dirname ${BASH_SOURCE})
swaymsg workspace number 1 && sleep 0.5 && ${DIRNAME}/lock-screen-swaylock.sh
# sleep 1
# ~/script/lock-screen-with-i3lock.sh

