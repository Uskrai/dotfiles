#!/bin/zsh

export WAYLAND_DISPLAY=wayland-1
export XAUTHORITY=/home/uskrai/.Xauthority
export XDG_RUNTIME_DIR=/run/user/1000

IMAGE=$(find ~/.wallpaper -type f| shuf -n 1)
echo $IMAGE;

export SHELL=/bin/zsh 
export PATH=/home/uskrai/.deno/bin:/opt/clang-format-static/:/home/uskrai/.yarn/bin/:/home/uskrai/.config/composer/vendor/bin:/home/uskrai/.local/bin/:/home/uskrai/bin:/usr/local/bin:/home/uskrai/.local/share/gem/ruby/2.7.0/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/opt/android-sdk/emulator:/home/uskrai/.dotnet/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin 
export DISPLAY=:0
export DBUS_SESSION_ADDRESS=unix:path=/run/user/1000/bus 
export XDG_RUNTIME_DIR=/run/user/1000

setwallpaper --verbose $IMAGE
# kill -9 $(pidof swaybg)
#
# swaybg --image $IMAGE
