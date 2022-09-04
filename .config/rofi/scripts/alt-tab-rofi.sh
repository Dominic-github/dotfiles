#!/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-6"
theme='style-4'


## Run

rofi \
	-show window \
    -theme ${dir}/${theme}.rasi \
 	-kb-cancel "Alt+Escape,Escape" \
  	-kb-accept-entry "!Alt-Tab,!Alt+Alt_L,Return"\
  	-kb-row-down "Alt+Tab,Alt+Down" \
  	-kb-row-up "Alt+ISO_Left_Tab,Alt+Up"
