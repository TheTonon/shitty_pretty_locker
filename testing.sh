#!/usr/bin/sh

echo $(command -v i3lock)

if [ ! $(command -v i3lock) ]; then
	echo "AAAA"
fi