#!/bin/bash

for i in */;
do
	i=${i%?}
	echo "$i"
	zip "$i.zip" "$i/" -rm
done

