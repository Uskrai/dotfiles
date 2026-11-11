# zellij: attach or create a session named after the cwd
zc() { zellij attach -c "${PWD:t}" "$@"; }

# tmux: attach or create a session named after the cwd
tc() { tmux new -A -s "${PWD:t}" "$@"; }

# remove empty directory recursively
rmdirr() { find "${@:-.}" -type d -empty -delete; }
