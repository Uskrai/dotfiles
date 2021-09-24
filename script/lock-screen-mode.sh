#!/usr/bin/bash

if [ x"$@" = x"Enable Lockscreen" ]
then
    xautolock -enable
    exit 0
elif [ x"$@" = x"Disable Lockscreen" ]
then
    xautolock -disable
    exit 0
fi

echo "Enable Lockscreen"
echo "Disable Lockscreen"
