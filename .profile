PROCESS=$(ps -o comm= $PPID)
if [[ $HOME_PROFILE_INIT == $PROCESS ]] 
then
  return
fi
export HOME_PROFILE_INIT="$PROCESS"

# export QT_STYLE_OVERRIDE=adwaita-dark
export QT_QPA_PLATFORMTHEME=qt5ct:qt6ct
export QT_QPA_PLATFORM=wayland

export EDITOR=nvim
export PAGER=bat
export BAT_PAGER="less -RFX"

export GTK_THEME=Adwaita:dark
export CALIBRE_USE_DARK_PALETTE=1

export TMP=/tmp
export TMPDIR=$TMP

# XDG stuff
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_LIB_HOME="$HOME/.local/lib"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export XDG_CURRENT_DESKTOP=sway

export DENO_INSTALL="${XDG_BIN_HOME%/bin}"

# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java 
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# DATA

export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export RUST_NIGHTLY_TOOLCHAIN=nightly-2023-09-01-x86_64-unknown-linux-gnu
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# export CARGO_NET_GIT_FETCH_WITH_CLI=true
export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export GOPATH="$XDG_DATA_HOME"/go
export PERF_BUILDID_DIR="$XDG_DATA_HOME"/debug
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages 

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

# alias
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

export RXVT_SOCKET="$XDG_RUNTIME_DIR"/urxvtd

export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/usr/lib64/jvm/default/lib/:/usr/lib64/jvm/default/lib/server:/usr/lib64/jvm/default/jre/lib/amd64/server"

export GPG_TTY=$(tty)
export PINENTRY_USER_DATA=USE_TTY=1
export WINEPREFIX="$HOME/.wine"

export CHROME_EXECUTABLE=chromium
export MANGOHUD=0

export PNPM_HOME=$XDG_DATA_HOME/pnpm

export PATH="$CARGO_HOME/bin:$PNPM_HOME:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$XDG_DATA_HOME/gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.yarn/bin/:$HOME/.config/composer/vendor/bin:$HOME/.local/bin/:$PATH"
export PATH=""/opt/clang-format-static/:$PATH""
export PATH="$PATH:$HOME/lib/cg_clif-x86_64-unknown-linux-gnu/dist/bin"
export PATH="$XDG_DATA_HOME/fvm/default/bin:$HOME/.pub-cache/bin:$PATH"

export MOZ_ENABLE_WAYLAND=1

export RUST_LOG=info

export OBS_VKCAPTURE=1
# export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

export USER_UID=`id -u`
export USER_GID=`id -g`

export DIRENV_WARN_TIMEOUT=0
export ALIASES_DIR=$HOME/project/aliases

alias lsc="/usr/bin/ls"
alias ls="eza"
alias l="ls -la"
