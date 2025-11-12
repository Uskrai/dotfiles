#!/bin/bash

cd $XDG_CONFIG_HOME/input-remapper-2/presets

get_all() {
	for f in */*.json; do
		echo $f
	done
}

choice=$(get_all | rofi -dmenu)

device=$(dirname "$choice")
preset=$(basename -s .json "$choice")

input-remapper-control --device "$device" --preset "$preset" --command start
