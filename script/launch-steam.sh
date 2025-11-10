#!/bin/bash
appid=$1
path=$2
shift;
shift;
STEAM_RUNTIME=$HOME/.local/share/Steam

echo $appid $path $@ >> ~/script/launch-steam.log 

WINEFSYNC=1 \
  WINEPREFIX=$STEAM_RUNTIME/steamapps/compatdata/$appid/pfx/ \
  $STEAM_RUNTIME/steamapps/common/Proton\ -\ Experimental/files/bin/wine64 \
  $path $@ 
