source $HOME/.profile
export ZDOTDIR="$HOME/.config/zsh"

if tty -s; then
	export GPG_TTY=$(tty)
fi
