FILENAME=$3;
if [ -z $FILENAME ]
then
  FILENAME="$HOME/Pictures/$(date +%Y-%m-%d-%H:%M:%S:%N)_clipboard.$2";
fi

xclip -selection clipboard -t $1 -o > "$FILENAME"
