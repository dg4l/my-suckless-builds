#!/bin/bash

# todo: maybe eventually get the volume percentage from a file which is changed by 
# either another script or this one, instead of hardcoded 5% we can use keybinds in our wm to change
# the percentage.

header="Volume Changed"
 
# works for now but might be fragile
get_volume() {
    echo "$(pactl get-sink-volume @DEFAULT_SINK@ | head -1 | awk -F'[:/]' '{print $4}' | sed 's/^[ \t]*//;s/[ \t]*$//')"
}

vol_notify() {
    notify-send -t 1500 "$1" "$2"
}

toggle_audio() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    vol_notify "$header" "toggled audio"
}

toggle_mic() {
    pactl set-source-mute @DEFAULT_SOURCE@ toggle
    vol_notify "$header" "toggled mic"
}

vol_up() {
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    vol_notify "$header" "+5%"
}

vol_down() {
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    vol_notify "$header" "\-5%"
}

# do nothing if no argument is passed, fail silently :)
if [ "$1" = "up" ]; then
    vol_up
elif [ "$1" = "down" ]; then
    vol_down
elif [ "$1" = "toggleaudio" ]; then
    toggle_audio 
elif [ "$1" = "togglemic" ]; then
    toggle_mic 
elif [ "$1" = "getvol" ]; then
    get_volume
fi
