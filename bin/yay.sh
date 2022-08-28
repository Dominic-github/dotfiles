#!/bin/bash

declare BASEDIR=$HOME

declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1

declare YAYINSTALL="yay -S --noconfirm "


function SETTIMEOUT(){
	msg "$1"
	timeout 5s bash <<EOT
	sleep 10
EOT
}
function nextStep(){
	bash $HOME/.dotfiles/bin/bootstrap.sh
}


function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}


function main(){

	detect_platform

	DependenceYay
	
	nextStep

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



	
function DependenceYay(){
	#!!!!!!!!! IMPORTANT !!!!!!!


	########## Yay ##########
echo "
=============================
|     	     Yay             |
==============================
"

if test ! $(which yay); then
   $RECOMMEND_INSTALL --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/git-clone/yay && cd ~/git-clone/yay && makepkg -si && cd $HOME

else
	echo ""
	echo "yay is successfully installed"
	echo ""
fi


	########## Betterlockscreen - locker-background ##########
echo "
=============================
|      betterlockscreen      |
==============================
"
if test ! $(which betterlockscreen);then
	$YAYINSTALL betterlockscreen-git
else
	echo ""
	echo "betterlockscreen is successfully installed"
	echo ""

fi

	########## Xidlehook - system suspend ##########
echo "
=============================
|         xidlehook          |
==============================
"
if test ! $(which xidlehook);then
	$YAYINSTALL xidlehook
else
	echo ""
	echo "xidlehook is successfully installed"
	echo ""

fi

### System Requirements Of Betterlockscreen
	########## i3lock - required  ##########
echo "
=============================
|        i3lock-color        |
==============================
"
if test ! $(which i3lock);then
	$YAYINSTALL i3lock-color
else
	echo ""
	echo "i3lock-color is successfully installed"
	echo ""
fi
### End required


	########## lightdm - login screen ##########
echo "
===================================
|    lightdm-webkit-theme-aether   |
====================================
"

## lightdm-webkit-theme-aether required: 
##          + lightdm-webkit2-greeter 
##          + lightdm
if test ! $(which lightdm-webkit2-greeter);then
	$YAYINSTALL lightdm-webkit-theme-aether-git
else
	echo ""
	echo "lightdm-webkit-theme-aether is successfully installed"
	echo ""
fi


	########## Brave-nightly - Web browse ##########
echo "
=============================
|       brave-nightly        |
==============================
"
if test ! $(which brave-nightly);then
	$YAYINSTALL brave-nightly-bin
else
	echo ""
	echo "brave-nightly is successfully installed"
	echo ""
fi



	########## Logo-ls - show logo file on terminal  ##########
echo "
=============================
|          logo-ls           |
==============================
"
if test ! $(which logo-ls);then
	$YAYINSTALL logo-ls
else
	echo ""
	echo "logo-ls is successfully installed"
	echo ""
fi


	########## Lolcat - color neofetch ##########
echo "
=============================
|          lolcat            |
==============================
"
if test ! $(which lolcat);then
	$YAYINSTALL lolcat
else
	echo ""
	echo "lolcat is successfully installed"
	echo ""
fi


#########################################
#                Fonts                  #
#########################################

	########## Noto fonts - japanese ##########
$RECOMMEND_INSTALL noto-fonts-cjk noto-fonts-emoji noto-fonts

	########## Nerd font ##########

echo "
=============================
|         nerd-fonts         |
==============================
"


$YAYINSTALL nerd-fonts-fira-code
$YAYINSTALL nerd-fonts-roboto-mono


	########## material fonts ##########

echo "
=============================
|   material desgin icon     |
==============================
"
$YAYINSTALL ttf-material-design-icons-git

	########## unifont ##########

echo "
=============================
|          unifont           |
==============================
"
$YAYINSTALL ttf-unifont 


########## Other dependence ##########

##### imagemagickis for betterblockscreen
		if test ! $(which magick); then 
echo "
=============================
|           magick           |
==============================
"
		$RECOMMEND_INSTALL magick
	else
	echo ""
		echo "imagemagickis successfully installed"
	echo ""
	fi

##### xorg for betterblockscreen
echo "
=============================
|       xorg dependence      |
==============================
"
		$RECOMMEND_INSTALL xorg-xdpyinfo xorg-xrdb xorg-xrandr xorg-xset

##### w3m for ranger preview image

		if test ! $(which w3m); then 
echo "
=============================
|            w3m             |
==============================
							"
		$RECOMMEND_INSTALL w3m
	else
	echo ""
		echo "w3m successfully installed"
	echo ""
	fi


############### Themes ###############

########## GTK ################

echo "
=============================
|            GTK             |
==============================
"

$RECOMMEND_INSTALL gtk3 gtk4

	##########  lxappearance, qt5ct - Tool change theme ##########

echo "
=============================
|    lxappearance, qt5ct     |
==============================
"
	if test ! $(which lxappearance); then 
		$RECOMMEND_INSTALL lxappearance
		if test ! $(which qt5ct); then
			$RECOMMEND_INSTALL qt5ct	
		else
			echo ""
			echo "qt5ct is successfully installed"
			echo ""
		fi
	else
		echo ""
		echo "lxappearance is successfully installed"
		echo ""
	fi

	########## gtk-engine-murrine - Require Tool ##########
echo "
=============================
|      gtk-engine-murrine    |
==============================
"
		$RECOMMEND_INSTALL gtk-engine-murrine
		echo ""
		echo "gtk-engine-murrine is successfully installed"
		echo ""
	
	########## material-black-theme - gtk theme ##########
echo "
=============================
|  material-black-theme      |
==============================
"
		$YAYINSTALL material-black-colors-theme
		echo ""
		echo "material-black-theme is successfully installed"
		echo ""


	########## Candy-icons - Icon theme ##########
echo "
=============================
|        candy-icons         |
==============================
"
		$YAYINSTALL candy-icons-git
		echo ""
		echo "candy-icons is successfully installed"
		echo ""


	########## Sweet-cursors-theme - Cursor theme ##########
echo "
=============================
|     sweet-cursors-theme    |
==============================
"
		$YAYINSTALL sweet-cursors-theme-git
		echo ""
		echo "sweet-cursors-theme is successfully installed"
		echo ""

}

# Run main function
main "$@"


