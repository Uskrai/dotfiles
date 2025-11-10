#!/bin/bash
kopia snapshot create "$HOME"
# notify-send "<b font='26px'>Kopia Snapshot Created</b>" -a kopia
phrase="Kopia Snapshot Created at`date +'%l:%M %P'`"
/usr/bin/notify-send --icon=clock -t 4000 "Kopia" "<span font='26px'><i>$phrase</i></span>" >/dev/null 2>&1
