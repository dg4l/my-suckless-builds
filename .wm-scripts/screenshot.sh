#!/usr/bin/env bash

if [ "$1" = "-scr" ]; then
    # in the future this will bring up a dmenu asking which screen to take a screenshot of
    echo "todo" 
elif [ "$1" = "-full" ]; then
    xnap -f | magick - PNG:- | xclip -selection clipboard -t image/png
elif [ "$1" = "-window" ]; then
    xnap -w | magick - PNG:- | xclip -selection clipboard -t image/png
elif [ "$1" = "-sel" ]; then
    xnap | magick - PNG:- | xclip -selection clipboard -t image/png
fi
