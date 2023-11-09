#!/bin/bash


# =============================================================


function main(){

	Dependence

	nextStep
}


# =============================================================

function nextStep(){

	bash $HOME/.dotfiles/bin/yay.sh
}


# $1 is text, "" if you dont want show text
# $2 is time delay , default is 5s
# using ex: SETTIMEOUT "abc" 2s
# using ex: SETTIMEOUT "" 2s
# using ex: SETTIMEOUT "asdasd" 

function SETTIMEOUT(){

	DefaultTime=5s

	if ! [ -z $2 ] ;then
		DefaultTime=$2
	fi
    
	if ! [ -z "$1" ] ;then
		msg "$1"
	fi
	timeout $DefaultTime bash <<EOT
	sleep 10
EOT
}



function msg() {

  local text="$1"
  local div_width="80"

  echo -e ${BPurple}$(printf "%${div_width}s\n" ' ' | tr ' ' -) ${Color_Off}

  echo -e ${BYellow}"[!] $(printf "%s\n" "$text")" ${Color_Off}
}

function confirm() {

  local question="$1"
  while true; do
    msg "$question"
	SETTIMEOUT "Please read carefully before answering. You have 5 seconds"
    read -p "[y]es or [N]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
         echo -e ${BYellow}"Please answer [y]es or [n]o.\n" ${Color_Off}

        ;;
    esac
  done

  echo $answer
}


	
function Dependence(){

	#!!!!!!!!! IMPORTANT !!!!!!!

echo -e ${BPurple}"
	$(cat <<'EOF'

  ___           _        _ _                            
 |_ _|_ __  ___| |_ __ _| | |                           
  | || '_ \/ __| __/ _` | | |                           
  | || | | \__ \ || (_| | | |                           
 |___|_| |_|___/\__\__,_|_|_|     _                     
 |  _ \  ___ _ __   ___ _ __   __| | ___ _ __   ___ ___ 
 | | | |/ _ \ '_ \ / _ \ '_ \ / _` |/ _ \ '_ \ / __/ _ \
 | |_| |  __/ |_) |  __/ | | | (_| |  __/ | | | (_|  __/
 |____/ \___| .__/ \___|_| |_|\__,_|\___|_| |_|\___\___|
            |_|                                         

# author: Dominic-github
# github: https://github.com/Dominic-github

EOF

)" ${Color_Off}


	
# Dependence

	########## hyprland - desktop manager ##########

	echo -e ${BBlue}"\n[*] Installing hyprland ... \n" ${Color_Off}
  if ! [ $(which Hyprland) ] ; then 
		$RECOMMEND_INSTALL hyprland
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Hyprland is successfully Installed.\n" ${Color_Off}
	fi

	########## waybar ##########
	echo -e ${BBlue}"\n[*] Installing waybar ... \n" ${Color_Off}
  if ! [ $(which waybar) ] ; then 
    $RECOMMEND_INSTALL waybar
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Waybar is successfully Installed.\n" ${Color_Off}

	fi


	########## fish - Shell ##########
	echo -e ${BBlue}"\n[*] Installing Fish ... \n" ${Color_Off}
	if ! [ $(which fish) ] ; then 
		$RECOMMEND_INSTALL fish
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Fish is successfully Installed.\n" ${Color_Off}

	fi


	########## Rofi - Application Launcher##########
	echo -e ${BBlue}"\n[*] Installing Rofi ... \n" ${Color_Off}
	if ! [ $(which rofi) ] ; then 
		$RECOMMEND_INSTALL rofi
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Rofi is successfully Installed.\n" ${Color_Off}

	fi


	########## Kitty - Terminal ##########
	echo -e ${BBlue}"\n[*] Installing Kitty ... \n" ${Color_Off}
	if ! [ $(which kitty) ] ; then 
		$RECOMMEND_INSTALL kitty
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Kitty is successfully Installed.\n" ${Color_Off}
	fi

	########## Imagemagick - image on kitty ##########
	echo -e ${BBlue}"\n[*] Installing imagemagick ... \n" ${Color_Off}
	$RECOMMEND_INSTALL imagemagick 
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] imagemagick is successfully Installed.\n" ${Color_Off}

	########## Xdotool - image on kitty ##########
	echo -e ${BBlue}"\n[*] Installing xdotool ... \n" ${Color_Off}
  $RECOMMEND_INSTALL xdotool 
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] imagemagick is successfully Installed.\n" ${Color_Off}


	########## Pipewire - screenshare ##########
	echo -e ${BBlue}"\n[*] Installing pipewire... \n" ${Color_Off}
	$RECOMMEND_INSTALL pipewire
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] pipewire is successfully Installed.\n" ${Color_Off}


	########## wireplumber - screenshare ##########
	echo -e ${BBlue}"\n[*] Installing wireplumber ... \n" ${Color_Off}
	$RECOMMEND_INSTALL wireplumber 
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Wireplumber  is successfully Installed.\n" ${Color_Off}


	########## StarShip - Prompt ##########

	echo -e ${BBlue}"\n[*] Installing StarShip ... \n" ${Color_Off}
	if ! [ $(which starship) ] ; then 
		$RECOMMEND_INSTALL starship
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] StarShip is successfully Installed.\n" ${Color_Off}
	fi
	

	########## Xorg - X11 Windows ##########
	echo -e ${BBlue}"\n[*] Installing Xorg ... \n" ${Color_Off}
		$RECOMMEND_INSTALL xorg
		SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Xorg is successfully Installed.\n" ${Color_Off}



	########## brightnessctl - control backlight ##########
	echo -e ${BBlue}"\n[*] Installing Brightnessctl ... \n" ${Color_Off}

	if ! [ $(which brightnessctl) ] ; then 
		$RECOMMEND_INSTALL brightnessctl
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Brightnessctl is successfully Installed.\n" ${Color_Off}

	fi


		########## Pamixer - control audio ##########
	echo -e ${BBlue}"\n[*] Installing Pamixer ... \n" ${Color_Off}
	if ! [ $(which pamixer) ] ; then 
		$RECOMMEND_INSTALL pamixer
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Pamixer is successfully Installed.\n" ${Color_Off}

	fi


		########## Arandr - Monitors GUI ##########
	echo -e ${BBlue}"\n[*] Installing Arandr ... \n" ${Color_Off}
	if ! [ $(which arandr) ] ; then 
		$RECOMMEND_INSTALL  arandr
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Arandr is successfully Installed.\n" ${Color_Off}

	fi


		########## Nemo - File manager ##########
	echo -e ${BBlue}"\n[*] Installing Nemo ... \n" ${Color_Off}

	if ! [ $(which nemo) ] ; then 
		$RECOMMEND_INSTALL  nemo
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Nemo is successfully Installed.\n" ${Color_Off}

	fi


	########## Neofetch - control backlight ##########
	echo -e ${BBlue}"\n[*] Installing Neofetch ... \n" ${Color_Off}

	if ! [ $(which neofetch) ] ; then 
		$RECOMMEND_INSTALL neofetch
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Neofetch is successfully Installed.\n" ${Color_Off}

	fi


	########## Ranger - file manager on terminal ##########
	echo -e ${BBlue}"\n[*] Installing Ranger ... \n" ${Color_Off}

	if ! [ $(which ranger) ] ; then 
		$RECOMMEND_INSTALL ranger
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Ranger is successfully Installed.\n" ${Color_Off}

	fi

	########## Feh - Image viewer ##########
	echo -e ${BBlue}"\n[*] Installing Feh ... \n" ${Color_Off}
	if ! [ $(which feh) ] ; then 
		$RECOMMEND_INSTALL feh
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Feh is successfully Installed.\n" ${Color_Off}

	fi


	########## Swaybg- Image Screen ##########
	echo -e ${BBlue}"\n[*] Installing swaybg ... \n" ${Color_Off}
	if ! [ $(which swaybg) ] ; then 
		$RECOMMEND_INSTALL swaybg
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Swaybg is successfully Installed.\n" ${Color_Off}
	fi
	

	########## Vlc - Musics player ##########
	echo -e ${BBlue}"\n[*] Installing Vlc ... \n" ${Color_Off}

	if ! [ $(which vlc) ] ; then 
		$RECOMMEND_INSTALL vlc
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Vlc is successfully Installed.\n" ${Color_Off}

	fi
	
	########## Python ##########
	echo -e ${BBlue}"\n[*] Installing Python ... \n" ${Color_Off}

	if ! [ $(which python) ]  || [ $(which python3) ] ; then 
		$RECOMMEND_INSTALL python3 python
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Python is successfully Installed.\n" ${Color_Off}

	fi


	########## Pulseaudio - audio ##########
	echo -e ${BBlue}"\n[*] Installing Pulseaudio ... \n" ${Color_Off}

	if ! [ $(which pulseaudio) ] ; then 
		$RECOMMEND_INSTALL pulseaudio pulseaudio-alsa pulseaudio-bluetooth
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Pulseaudio is successfully Installed.\n" ${Color_Off}

	fi


	########## Pavucontrol - GUI audio control ##########
	echo -e ${BBlue}"\n[*] Installing Pavucontrol ... \n" ${Color_Off}

	if ! [ $(which pavucontrol) ] ; then 
		$RECOMMEND_INSTALL pavucontrol 
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Pavucontrol is successfully Installed.\n" ${Color_Off}

	fi


	########## Dunst - notification ##########
	echo -e ${BBlue}"\n[*] Installing Dunst ... \n" ${Color_Off}

	if ! [ $(which dunst) ] ; then 
		$RECOMMEND_INSTALL dunst
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Dunst is successfully Installed.\n" ${Color_Off}

	fi

	########## fcitx5 - keyboard ##########
	echo -e ${BBlue}"\n[*] Installing fcitx5-unikey ... \n" ${Color_Off}
	if ! [ $(which fcitx5) ] ; then 
		$RECOMMEND_INSTALL fcitx5 fcitx5-qt fcitx5-gtk fcitx5-unikey kcm-fcitx5
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] fcitx5-unikey is successfully Installed.\n" ${Color_Off}

	fi

	########## Zathura - PDF view ##########
	echo -e ${BBlue}"\n[*] Installing Zathura ... \n" ${Color_Off}

  if ! [ $(which zathura) ] ; then 
    $RECOMMEND_INSTALL zathura
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Zathura is successfully Installed.\n" ${Color_Off}

	fi


	########## Xclip ##########
	echo -e ${BBlue}"\n[*] Installing Xclip ... \n" ${Color_Off}

	if ! [ $(which xclip) ] ; then 
		$RECOMMEND_INSTALL xclip
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Xclip is successfully Installed.\n" ${Color_Off}

	fi

	########## Swayidle ##########
	echo -e ${BBlue}"\n[*] Installing swayidle... \n" ${Color_Off}

  if ! [ $(which swayidle) ] ; then 
		$RECOMMEND_INSTALL swayidle
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Swayidle is successfully Installed.\n" ${Color_Off}

	fi


	########## gnome-tweaks ##########
	echo -e ${BBlue}"\n[*] Installing gnome-tweaks... \n" ${Color_Off}

  if ! [ $(which gnome-tweaks) ] ; then 
		$RECOMMEND_INSTALL gnome-tweaks
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Gnome-tweaks is successfully Installed.\n" ${Color_Off}

	fi


##############################################
#            NeoVim - text editor            #
##############################################

	echo -e ${BBlue}"\n[*] Installing neovim ... \n" ${Color_Off}
	if ! [ $(which nvim) ] ; then 
		$RECOMMEND_INSTALL neovim
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] fcitx5-unikey is successfully Installed.\n" ${Color_Off}
	fi
}


# Run main function

main "$@"


