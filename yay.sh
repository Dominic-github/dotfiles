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
	bash $HOME/.dotfiles/bootstrap.sh
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

mkdir $HOME/Document/test/git-clone

if test ! $(which yay); then
   $RECOMMEND_INSTALL --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/git-clone/yay && cd ~/git-clone/yay && makepkg -si && cd $HOME

else
	printf "yay is successfully installed"
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
	printf "betterlockscreen is successfully installed"

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
	printf "i3lock-color is successfully installed"
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
	printf "lightdm-webkit-theme-aether is successfully installed"
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
	printf "brave-nightly is successfully installed"
fi

		########## Baka-mplayer - Video players ##########
echo "
=============================
|        baka-mplayer        |
==============================
"	
#using baka-mplayer-git for fix bug
	if test ! $(which baka-mplayer); then 
		$YAYINSTALL baka-mplayer-git
	else
		printf "baka-mplayer is successfully installed"
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
	printf "logo-ls is successfully installed"
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
	printf "lolcat is successfully installed"
fi


#########################################
#                Fonts                  #
#########################################

	########## Noto fonts - japanese ##########
$RECOMMEND_INSTALL noto-fonts-cjk noto-fonts-emoji noto-fonts

	########## Nerd font ##########

$YAYINSTALL nerd-fonts-fira-code
$YAYINSTALL nerd-fonts-fira-mono
$YAYINSTALL nerd-fonts-roboto-mono


	########## material fonts ##########

$YAYINSTALL ttf-material-design-icons

	########## unifont ##########

$YAYINSTALL ttf-unifont 


########## Other dependence ##########

##### imagemagickis for betterblockscreen
		if test ! $(which magick); then 
		$RECOMMEND_INSTALL magick
	else
		printf "imagemagickis successfully installed"
	fi

##### xorg for betterblockscreen
		$RECOMMEND_INSTALL xorg-xdpyinfo xorg-xrdb xorg-xrandr xorg-xset

##### w3m for ranger preview image
		if test ! $(which w3m); then 
		$RECOMMEND_INSTALL w3m
	else
		printf "w3m successfully installed"
	fi


############### Themes ###############

########## GTK ################
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
			printf "qt5ct is successfully installed"
		fi
	else
		printf "lxappearance is successfully installed"
	fi

	########## gtk-engine-murrine - Require Tool ##########
echo "
=============================
|      gtk-engine-murrine    |
==============================
"
		$RECOMMEND_INSTALL gtk-engine-murrine
		printf "gtk-engine-murrine is successfully installed"
	
	########## Nordic-dark-theme - gtk theme ##########
echo "
=============================
|     nordic-dark-theme      |
==============================
"
		$YAYINSTALL nordic-darker-theme 
		printf "nordic-dark is successfully installed"


	########## Orchis-theme - gtk theme ##########
echo "
=============================
|        orchis-theme        |
==============================
"
		$YAYINSTALL  orchis-theme-git 
		printf "orchis-theme is successfully installed"

	########## Candy-icons - Icon theme ##########
echo "
=============================
|        candy-icons         |
==============================
"
		$YAYINSTALL candy-icons-git
		printf "candy-icons is successfully installed"


	########## Sweet-cursors-theme - Cursor theme ##########
echo "
=============================
|     sweet-cursors-theme    |
==============================
"
		$YAYINSTALL sweet-cursors-theme-git
		printf "sweet-cursors-theme is successfully installed"

}

# Run main function
main "$@"


