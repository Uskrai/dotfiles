#!/bin/bash

LOGFILE=$HOME/script/lock-screen.log

log ()
{
  DATE=$(date '+%Y-%m-%d %H:%M:%S')
  echo "[$DATE] $1" >> $LOGFILE
}

log "starting lock"

# screenshot current output
grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') /tmp/screen_locked.png

# Pixellate it 10x
mogrify -scale 10% -scale 1000% /tmp/screen_locked.png

log "Pagse dunstctl"
# Pause dunstctl
dunstctl set-paused true

# Lock screen displaying this image.
# PID=`sh -c 'echo $$; exec swaylock --daemonize -i /tmp/screen_locked.png'`;
swaylock --daemonize -i /tmp/screen_locked.png

# log "Waiting lock to exit"
# tail --pid=$PID -f /dev/null;
# dunstctl set-paused false

log "end locking"

#kill_and_unpause_notifications() {
  #pkill -xu $EUID i3lock
  #pkill -xu $EUID -USR2 dunst
#}

##if [[ -e /dev/fd/${XSS_SLEEP_LOCK_FD:--1} ]]; then
## Take a screenshot


  #trap kill_and_unpause_notifications TERM INT

  ## Pause notifications
  #pkill -xu $EUID -USR1 dunst

  ## Prevent i3lock from inheriting a copy of the lock fd
  #i3lock "${i3lock_options[@]}" {XSS_SLEEP_LOCK_FD}<&-

  ## Close the fd to indicate we're ready to sleep
  #exec {XSS_SLEEP_LOCK_FD}<&-

  #while pkill -xu $EUID -0 i3lock; do
    #sleep 0.5
  #done

  ## Unpause notifications
  #pkill -xu $EUID -USR2 dunst
#else
  #trap kill_and_unpause_notifications TERM INT
  #pkill -xu $EUID -USR1 dunst
  #i3lock -n "${i3lock_options[@]}" &
  #wait
  #pkill -xu $EUID -USR2 dunst
#fi
