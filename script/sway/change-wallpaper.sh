#!/bin/zsh

export WAYLAND_DISPLAY=wayland-1
export XAUTHORITY=$HOME/.Xauthority
export XDG_RUNTIME_DIR=/run/user/1000

IMAGE=$(find ~/.wallpaper/blue-archive/119185606_p0.jpg -type f| shuf -n 1)
echo $IMAGE;

export SHELL=/bin/zsh 
# export PATH=$HOME/.deno/bin:/opt/clang-format-static/:$HOME/.yarn/bin/:$HOME/.config/composer/vendor/bin:$HOME/.local/bin/:$HOME/bin:/usr/local/bin:$HOME/.local/share/gem/ruby/2.7.0/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/opt/android-sdk/emulator:$HOME/.dotnet/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin 


export DISPLAY=:0
export DBUS_SESSION_ADDRESS=unix:path=/run/user/1000/bus 
export XDG_RUNTIME_DIR=/run/user/1000

setwallpaper --verbose $IMAGE
