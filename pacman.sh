#!/bin/bash

declare BASEDIR=$HOME

declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1

function SETTIMEOUT(){
	msg "$1"
	timeout 5s bash <<EOT
	sleep 10
EOT
}

function main(){
	detect_platform

	Dependence

	# nextStep
}


function nextStep(){
	bash $HOME/.dotfiles/yay.sh
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S --noconfirm "
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      echo "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

	
function Dependence(){
	#!!!!!!!!! IMPORTANT !!!!!!!

 cat <<'EOF'

			█ █▄░█ █▀ ▀█▀ ▄▀█ █░░ █░░
			█ █░▀█ ▄█ ░█░ █▀█ █▄▄ █▄▄

	█▀▄ █▀▀ █▀█ █▀▀ █▄░█ █▀▄ █▀▀ █▄░█ █▀▀ █▀▀
	█▄▀ ██▄ █▀▀ ██▄ █░▀█ █▄▀ ██▄ █░▀█ █▄▄ ██▄

# author: Frey1a
# github: https://github.com/Frey1a

EOF
	
# Dependence

	########## I3 - desktop manager ##########
echo "
=============================
|     	      i3             |
==============================
"
	if test ! $(which i3); then 
		$RECOMMEND_INSTALL i3-gaps
	else
		printf "i3 is successfully installed"
	fi

	

	########## fish - Shell ##########
echo "
=============================
|     	     fish            |
==============================
"
	if test ! $(which fish); then 
		$RECOMMEND_INSTALL fish
	else
		printf "fish is successfully installed"
	fi


	########## Rofi - Application Launcher##########
echo "
=============================
|     	     rofi            |
==============================
"	
	if test ! $(which rofi); then 
		$RECOMMEND_INSTALL rofi
	else
		printf "rofi is successfully installed"
	fi


	########## Kitty - Terminal ##########
echo "
=============================
|     	    kitty            |
==============================
"	
	if test ! $(which kitty); then 
		$RECOMMEND_INSTALL kitty
	else
		printf "kitty is successfully installed"
	fi

	########## Picom - compositor for X ##########
echo "
=============================
|     	    picom            |
==============================
"		
	if test ! $(which picom); then 
		$RECOMMEND_INSTALL picom
	else
		printf "picom is successfully installed"
	fi
	

	########## StarShip - Prompt ##########
echo "
=============================
|     	   starship          |
==============================
"	
	if test ! $(which starship); then 
		$RECOMMEND_INSTALL starship
	else
		printf "starship is successfully installed"
	fi
	

	########## brightnessctl - control backlight ##########
echo "
=============================
|      	brightnessctl        |
==============================
"	
	if test ! $(which brightnessctl); then 
		$RECOMMEND_INSTALL brightnessctl
	else
		printf "brightnessctl is successfully installed"
	fi


		########## Pamixer - control audio ##########
echo "
=============================
|          pamixer           |
==============================
"	
	if test ! $(which pamixer); then 
		$RECOMMEND_INSTALL pamixer
	else
		printf "pamixer is successfully installed"
	fi



		########## Rhythmbox - Audio players ##########
echo "
=============================
|         rhythmbox          |
==============================
"	
	if test ! $(which rhythmbox); then 
		$RECOMMEND_INSTALL rhythmbox 
	else
		printf "rhythmbox is successfully installed"
	fi

		########## Arandr - Monitors GUI ##########
echo "
=============================
|           arandr           |
==============================
"	
	if test ! $(which arandr); then 
		$RECOMMEND_INSTALL  arandr
	else
		printf "arandr is successfully installed"
	fi


		########## Nemo - File manager ##########
echo "
=============================
|            Nemo            |
==============================
"	
	if test ! $(which nemo); then 
		$RECOMMEND_INSTALL  nemo
	else
		printf "nemo is successfully installed"
	fi


	########## Brightnessctl - control backlight ##########
echo "
=============================
|      	brightnessctl        |
==============================
"	
		$RECOMMEND_INSTALL brightnessctl
		printf "brightnessctl is successfully installed"


	########## Neofetch - control backlight ##########
echo "
=============================
|      	   neofetch          |
==============================
"	
	if test ! $(which neofetch); then 
		$RECOMMEND_INSTALL neofetch
	else
		printf "neofetch is successfully installed"
	fi


	########## Print screenshot ##########
echo "
=============================
|      xclip and maim        |
==============================
"	
	if test ! $(which xclip); then 
		$RECOMMEND_INSTALL xclip
	else
		printf "xclip is successfully installed"
	fi
	
	if test ! $(which maim); then 
		$RECOMMEND_INSTALL maim
	else
		printf "maim is successfully installed"
	fi

	########## Ranger - file manager on terminal ##########
echo "
=============================
|     	    ranger           |
==============================
"
	if test ! $(which ranger); then 
		$RECOMMEND_INSTALL ranger
	else
		printf "ranger is successfully installed"
	fi

	########## Feh - Image viewer ##########
echo "
=============================
|     	     feh             |
==============================
"
	if test ! $(which feh); then 
		$RECOMMEND_INSTALL feh
	else
		printf "feh is successfully installed"
	fi

	########## Nitrogen - GUI for setting wallpapers ##########
echo "
=============================
|     	   nitrogen          |
==============================
"
	if test ! $(which nitrogen); then 
		$RECOMMEND_INSTALL nitrogen
	else
		printf "nitrogen is successfully installed"
	fi


	########## Sxiv - Image viewer ##########
echo "
=============================
|     	     sxiv             |
==============================
"
	if test ! $(which sxiv); then 
		$RECOMMEND_INSTALL sxiv
	else
		printf "sxiv is successfully installed"
	fi

	
	########## Polybar - Status bar ##########
echo "
=============================
|     	    polybar          |
==============================
"
	if test ! $(which polybar); then 
		$RECOMMEND_INSTALL polybar
	else
		printf "polybar is successfully installed"
	fi

	########## Vlc - Musics player ##########
echo "
=============================
|     	     vlc             |
==============================
"
	if test ! $(which vlc); then 
		$RECOMMEND_INSTALL vlc
	else
		printf "vlc is successfully installed"
	fi
	
	########## Python ##########
echo "
=============================
|     	    python           |
==============================
"
	if test ! $(which python) || test ! $(which python3); then 
		$RECOMMEND_INSTALL python3
	else
		printf "python is successfully installed"
	fi


	########## Pulseaudio - audio ##########
echo "
=============================
|     	  pulseaudio         |
==============================
"
	if test ! $(which pulseaudio); then 
		$RECOMMEND_INSTALL pulseaudio pulseaudio-alsa pulseaudio-bluetooth
	else
		printf "pulseaudio is successfully installed"
	fi


	########## Pavucontrol - GUI audio control ##########
echo "
=============================
|     	  pavucontrol         |
==============================
"
	if test ! $(which pavucontrol); then 
		$RECOMMEND_INSTALL pavucontrol 
	else
		printf "pavucontrol is successfully installed"
	fi


	########## Dunst - notification ##########
echo "
=============================
|     	    dunst            |
==============================
"
	if test ! $(which dunst); then 
		$RECOMMEND_INSTALL dunst
	else
		printf "dunst is successfully installed"
	fi

##############################################
#            NeoVim - text editor            #
##############################################

	if confirm "Would you like to Install NEOVIM"; then
		NeovimInstall
	fi

}


function NeovimInstall(){
	bash $HOME/.dotfiles/neovim.sh
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
        echo "Please answer [y]es or [n]o."
        ;;
    esac
  done

  echo $answer
}


# add group video backlight if enable-scroll not work

# sudo tee -a /etc/udev/rules.d/backlight.rules <<EOF
# ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", GROUP="video", MODE="0664"
#
# RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness"
# RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
# EOF


# Run main function
main "$@"

