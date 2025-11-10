#!/bin/sh

if mountpoint -q "$HOME/dling/secret"; then
  gdu "$HOME/dling/" -i "$HOME/dling/secret.encrypted" -i "$HOME/dling/secret/backup" -o ~/dling.analyzed
  #updatedb -o ~/.mlocate-dling --database-root ~/dling -l 0 -v # -e /mnt/e/SteamLibrary/steamapps/downloading/secret.encrypted
else
  echo "not mountpoint"
fi
