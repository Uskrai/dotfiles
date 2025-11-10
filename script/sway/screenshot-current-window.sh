path=~/Pictures/$(date +%Y-%m-%d-%H:%M:%S:%N)_screenshot.png
grim -g "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | tee $path | wl-copy

notify-send -i "$path" "Window Screenshoted"
