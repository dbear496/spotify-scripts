#!/usr/bin/env bash

# argument parsing from https://stackoverflow.com/a/14203146/8353152
r=false
track=false
ad=false
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -r)
      r=true
      shift # past argument
      ;;
    --track)
      track=true
      shift # past argument
      ;;
    --ad)
      ad=true
      shift # past argument
      ;;
    *)    # unknown option\
      command=$key
      shift
      ;;
  esac
done

if ! ($track || $ad); then
  echo "error: must specify at least one of --track and --ad"
  exit 1
fi

dbus-monitor |
while read -r line; do
	if ($track && [[ $line =~ "spotify:track:" ]]) || ($ad && [[ $line =~ "spotify:ad:" ]]); then
    if $r; then {
  		sleep 1
  		bash -c "$command"
    } &
    else {
      sleep 1
      bash -c "$command"
      break
    }
    fi
	fi
done
# disown -a
