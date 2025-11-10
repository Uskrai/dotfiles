#/bin/bash

SWAYSCRIPT=$HOME/script/sway

source $SWAYSCRIPT/change-workspace/venv/bin/activate

python $SWAYSCRIPT/change-workspace/main.py "$@"
