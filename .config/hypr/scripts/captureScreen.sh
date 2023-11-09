#!/bin/bash

if [ -d ~/Pictures/Screenshots/];then
  mkdir ~/Pictures/Screenshots/
fi

grim -g "$(slurp -o)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of whole screen taken" -t 1000 # screenshot of chose the screen
