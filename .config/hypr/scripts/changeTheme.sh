#!/usr/bin/env bash

# Directory
hypr_dir="$HOME/.config/hypr"
hypr_theme_dir="$HOME/.config/hypr/themes"
wallpaper_dir="$HOME/.config/wallpaper"
fish_dir="$HOME/.config/fish"
zathura_dir="$HOME/.config/zathura/"
zathura_theme_dir="$HOME/.config/zathura/themes/"

prompt="rofi -dmenu -theme ~/.config/rofi/style-1.rasi"

# Theme
cancel="󰜺   Cancel"
theme1="   Dracula"
theme2="   Rosé Pine"
theme3="   Shado Theme"
theme4="   Gruvbox"
theme5="   Frappe"       # catppucin/hyprland
theme6="   Latte"        # catppucin/hyprland
theme7="   Macchiato"    # catppucin/hyprland
theme8="   Mocha"        # catppucin/hyprland

# Variable to pass to dmenu or rofi
option="$cancel\n$theme1\n$theme2\n$theme3\n$theme4\n$theme5\n$theme6\n$theme7\n$theme8"


reload(){
	hyprctl reload # restart hyprland
}

change_theme()
{
	cp ${hypr_theme_dir}/$1.conf ${hypr_theme_dir}/color.thmswitch
}

change_theme_kitty(){
  kitty +kitten themes --reload-in=all $1
}

change_theme_fish(){
  cp ${fish_dir}/themes/$1.theme ${fish_dir}/conf.d/color.fish
}
change_theme_zathura(){
	cp ${zathura_theme_dir}/$1 ${zathura_dir}/current-theme
}

update_wallpaper()
{
	cp ${wallpaper_dir}/$1 ${hypr_dir}/wallpaper.png

  neofetch --clean # clean cache neofetch
  pkill -kill swaybg # kill swaybg no duplicates
	swaybg -m fill -i ${hypr_dir}/wallpaper.png #new wp
}

select="$(echo -e "$option" | $prompt -p "Choose a theme: " )"
case $select in
	$theme1)
		change_theme dracula
    change_theme_kitty Dracula
    change_theme_fish light
    change_theme_zathura dracula
		update_wallpaper dracula.png
    reload
		;;
	$theme2)
		change_theme rose-pine
    change_theme_kitty "Rosé Pine"
    change_theme_fish light
    change_theme_zathura rose-pine
		update_wallpaper rose-pine.png
    reload
		;;
	$theme3)
		change_theme shadotheme
    change_theme_kitty shadotheme
    change_theme_fish light
    change_theme_zathura shadotheme
		update_wallpaper shadotheme.jpg
    reload

		;;
	$theme4)
		change_theme gruvbox
    change_theme_kitty "Gruvbox Dark Hard"
    change_theme_fish light
    change_theme_zathura gruvbox
		update_wallpaper gruvbox.jpg
    reload
		;;
	$theme5)
		change_theme frappe
    change_theme_kitty "Catppuccin Kitty Frappe"
    change_theme_fish light
    change_theme_zathura frappe
		update_wallpaper frappe.jpg
    reload
		;;
	$theme6)
		change_theme latte
    change_theme_kitty "Catppuccin Kitty Latte"
    change_theme_fish dark
    change_theme_zathura latte
		update_wallpaper latte.png
    reload
		;;
	$theme7)
		change_theme macchiato
    change_theme_kitty "Catppuccin Kitty Macchiato"
    change_theme_fish light
    change_theme_zathura macchiato
		update_wallpaper macchiato.jpg
    reload
		;;
	$theme8)
		change_theme mocha
    change_theme_kitty "Catppuccin Kitty Mocha"
    change_theme_fish light
    change_theme_zathura mocha
		update_wallpaper mocha.png
    reload
		;;
esac
