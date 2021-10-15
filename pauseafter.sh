#!/bin/bash

dbus-monitor |
while read -r line; do
	if [[ $line =~ "spotify:track:" ]]; then
		playerctl -p spotify pause
		break;
	fi
done
