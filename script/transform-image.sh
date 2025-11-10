#!/bin/sh

trap exit SIGINT
mkdir -p new;

output() {
    if [ ! -f "new/$2" ]; then
        echo "converting $1 to new/$2";

        extension="${2##*.}"
        if [ "$extension" == "jpg" ];
        then
            magick "$1" -resize 1280x1280\> -strip -quality 85 "new/$2";
        elif [ "$extension" == "gif" ];
        then
            magick "$1" -scale 1280x1280\> -layers Optimize -fuzz 7% "new/$2";
        else
            magick "$1" -resize 1280x1280\> -strip -quality 85 "new/$2";
        fi
        echo "done $1";
    else
        echo "skipping $1 exist new/$2";
    fi
}

declare -A tojpeg=(
    ["png"]=1 ["jpeg"]=1 ["jpg"]=1 ["webp"]=1
)

for i in *;
do
    if [ -f "$i" ]; then
        extension="${i##*.}"
        filename="${i%.*}"
        if [[ -n ${tojpeg[$extension]} ]];
        then
            output "$filename.$extension" "$filename.jpg"
        else
            output "$i" "$i"
        fi
    fi
done
