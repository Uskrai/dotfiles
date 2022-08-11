# export QT_STYLE_OVERRIDE=adwaita-dark
export QT_QPA_PLATFORMTHEME=qt5ct

export GTK_THEME=Adwaita:dark

export TMP=/tmp
export TMPDIR=$TMP

# XDG stuff
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_LIB_HOME="$HOME/.local/lib"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export DENO_INSTALL="${XDG_BIN_HOME%/bin}"

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java 
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# DATA
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PATH="$CARGO_HOME/bin:$PATH"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

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
