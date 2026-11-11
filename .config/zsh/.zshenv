source $HOME/.profile
export ZDOTDIR="$HOME/.config/zsh"

if tty -s; then
	export GPG_TTY=$(tty)
fi

if [[ -n ${ZELLIJ_SESSION_NAME-} ]]; then
	export PINENTRY_USER_DATA="ZELLIJ_SESSION_NAME=$ZELLIJ_SESSION_NAME"
fi
