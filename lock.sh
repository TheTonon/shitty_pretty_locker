#!/usr/bin/sh

RUN=true

if [ ! $(command -v i3lock) ]; then
  echo "Dude u missin i3lock"
	RUN=false
fi

if [ ! $(command -v ffmpeg) ]; then
	echo "There's a lack of ffmpeg here"
	RUN=false
fi

if [ ! $(command -v xdpyinfo)]; then
    echo "Dont open a new issue if you do not have xdpyinfo installed"
    RUN=false
fi

if [ "$RUN" = true ]; then
  image_file=/tmp/screen_lock.png

  resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')

  filters='noise=alls=10,scale=iw*.05:-1,scale=iw*20:-1:flags=neighbor' 

  ffmpeg -y -loglevel 0 -s "$resolution" -f x11grab -i $DISPLAY -vframes 1 \
         -vf "$filters" "$image_file"

  i3lock -e -i "$image_file"
fi
