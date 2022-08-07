#!/bin/sh

trap exit SIGINT
# printout() {
#   exit
# }

for i in *;
do
  if [ ! -f "new/$i" ]; then
    convert "$i" -resize 2000x2000\> "new/$i";
  fi
  echo "done $i";
done
