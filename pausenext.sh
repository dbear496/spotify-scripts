#!/usr/bin/env bash

dbus-monitor |
while read -r line; do
  if [[ $line =~ "/com/spotify/track/" ]]; then
    playerctl -p spotify pause
    break
  fi
done #&
# disown -a
