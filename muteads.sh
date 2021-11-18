#!/usr/bin/env bash


setMute() {
    local index=$(getIndex "application\\.name = \"$1\"")
    local set
    if [ $2 = "mute" ]; then
        set=1
    elif [ $2 = "unmute" ]; then
        set=0
    elif [ $2 = "toggle" -o -z $2 ]; then
        echo "toggle unsupported"
        return -1
    else
        echo "unknown option: $2"
        return -1
    fi
    
    for i in $index; do
        pacmd set-sink-input-mute $i $set >/dev/null
    done
}

getIndex() {
    local index
    pacmd list-sink-inputs |
    while read -r lsiline; do
        index=$(echo "$lsiline" |
                sed -E "s/index: ([0-9]+)/\\1/; t; c\\$index")
        if [[ $lsiline =~ $1 ]]; then
            echo $index
        fi
    done |
    tr '\n' ' '
}

getSinkInput() {
    pacmd list-sink-inputs |
    while read -r lsiline; do
        index=$((echo "$lsiline" |
                 sed -E "s/index: ([0-9]+)/\\1/; t; c\\$index"))
        for i in $1; do
            if [ $index -eq $i ]; then
                echo $lsiline
            fi
        done
    done
}


dbus-monitor |
while read -r line; do
	if [[ $line =~ "spotify:track:" ]]; then
		sleep 1
		# amixer -q -D pulse set Master unmute # unmute speakers
		setMute spotify unmute # unmute spotify
	elif [[ $line =~ "spotify:ad:" ]]; then
		sleep 1
		# amixer -q -D pulse set Master mute # mute speakers
		setMute spotify mute # mute spotify
	fi &
done &
disown -a
