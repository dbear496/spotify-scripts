#!/bin/bash

dbus-monitor |
while read -r line; do
	if [[ $line =~ "spotify:track:" ]]; then {
		sleep 1
		amixer -q -D pulse set Master unmute
	} &
	elif [[ $line =~ "spotify:ad:" ]]; then {
		sleep 1
		amixer -q -D pulse set Master mute
	} &
	fi
done
