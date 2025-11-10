grim -o $(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name') - | tee ~/Pictures/$(date +%Y-%m-%d-%H:%M:%S:%N)_screenshot.png | wl-copy

