#!/bin/bash

if [ -d ~/Pictures/Screenshots/];then
  mkdir ~/Pictures/Screenshots/
fi

grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of the region taken" -t 1000 # screenshot of a region
