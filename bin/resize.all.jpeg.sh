#!/bin/bash

wanted_width=1366
echo "==================================="
echo "=== Resizing all images to $wanted_width ==="
echo "==================================="
echo

for each in `ls *.jpg` ; do
    if [ "$(convert $each -print "%w\n" /dev/null)" -gt "$wanted_width" ] ; then
        echo "$each is bigger than wanted width. Resizing..."
        #convert -resize $wanted_width $each $each
    else
        echo "$each is just about right or smaller. Skipping..."
    fi
done

