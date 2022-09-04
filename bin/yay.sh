#!/bin/bash


# =============================================================

function main(){

	DependenceYay
	
	nextStep

}


# =============================================================

function nextStep(){

	bash $HOME/.dotfiles/bin/bootstrap.sh
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


	
function DependenceYay(){

	#!!!!!!!!! IMPORTANT !!!!!!!


	########## Yay ##########
	echo -e ${BBlue}"\n[*] Installing Yay ... \n" ${Color_Off}


	if ! [ $(which yay) ]; then
   		$RECOMMEND_INSTALL --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/git-clone/yay && cd ~/git-clone/yay && makepkg -si && cd $HOME

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Yay is successfully Installed.\n" ${Color_Off}

	fi


	########## Betterlockscreen - locker-background ##########
	echo -e ${BBlue}"\n[*] Installing Betterlockscreen ... \n" ${Color_Off}

	if ! [ $(which betterlockscreen) ];then
		$YAYINSTALL betterlockscreen-git

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Betterlockscreen is successfully Installed.\n" ${Color_Off}

	fi

	########## Xidlehook - system suspend ##########
	echo -e ${BBlue}"\n[*] Installing Xidlehook ... \n" ${Color_Off}

	if ! [ $(which xidlehook) ] ;then
		$YAYINSTALL xidlehook

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Xidlehook is successfully Installed.\n" ${Color_Off}

	fi

### System Requirements Of Betterlockscreen
	########## i3lock - required  ##########
	echo -e ${BBlue}"\n[*] Installing i3-lock ... \n" ${Color_Off}

	if ! [  $(which i3lock) ];then
		$YAYINSTALL i3lock-color

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] I3-lock is successfully Installed.\n" ${Color_Off}

	fi
### End required


	########## lightdm - login screen ##########
	echo -e ${BBlue}"\n[*] Installing Lightdm-webkit-theme-aether ... \n" ${Color_Off}


## lightdm-webkit-theme-aether required: 
##          + lightdm-webkit2-greeter 
##          + lightdm

	if ! [ $(which lightdm-webkit2-greeter) ];then
		$YAYINSTALL lightdm-webkit-theme-aether-git

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Lightdm-webkit-theme-aether is successfully Installed.\n" ${Color_Off}

	fi


	########## Brave-nightly - Web browse ##########
	echo -e ${BBlue}"\n[*] Installing Brave-nightly ... \n" ${Color_Off}

	if ! [ $(which brave-nightly) ];then
		$YAYINSTALL brave-nightly-bin

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Brave-nightly is successfully Installed.\n" ${Color_Off}

	fi



	########## Logo-ls - show logo file on terminal  ##########
	echo -e ${BBlue}"\n[*] Installing Logo-ls ... \n" ${Color_Off}

	if ! [ $(which logo-ls) ];then
		$YAYINSTALL logo-ls

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Logo-ls is successfully Installed.\n" ${Color_Off}

	fi


	########## Lolcat - color neofetch ##########
	echo -e ${BBlue}"\n[*] Installing Lolcat ... \n" ${Color_Off}

	if ! [ $(which lolcat) ];then
	$YAYINSTALL lolcat

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Lolcat is successfully Installed.\n" ${Color_Off}

	fi


#########################################
#                Fonts                  #
#########################################

	########## Noto fonts - japanese ##########
	echo -e ${BBlue}"\n[*] Installing Noto-fonts ... \n" ${Color_Off}

	$RECOMMEND_INSTALL noto-fonts-cjk noto-fonts-emoji noto-fonts

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Noto-fonts is successfully Installed.\n" ${Color_Off}


	########## Nerd font ##########

	## Fira Code Nerd Font

	echo -e ${BBlue}"\n[*] Installing Fira-Code-Nerd-Font ... \n" ${Color_Off}

	$YAYINSTALL nerd-fonts-fira-code
		
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Fira-Code-Nerd-Font is successfully Installed.\n" ${Color_Off}


	## Roboto Mono Nerd Font

	echo -e ${BBlue}"\n[*] Installing Roboto-Mono-Nerd-Font ... \n" ${Color_Off}

	$YAYINSTALL nerd-fonts-roboto-mono

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Roboto-Mono-Nerd-Font is successfully Installed.\n" ${Color_Off}

	########## material fonts ##########

	echo -e ${BBlue}"\n[*] Installing Material-design-icons ... \n" ${Color_Off}

	$YAYINSTALL ttf-material-design-icons-git

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Material-design-icons is successfully Installed.\n" ${Color_Off}


	########## unifont ##########

	echo -e ${BBlue}"\n[*] Installing Unifont ... \n" ${Color_Off}

	$YAYINSTALL ttf-unifont 

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Unifont is successfully Installed.\n" ${Color_Off}


########## Other dependence ##########

##### imagemagickis for betterblockscreen

	echo -e ${BBlue}"\n[*] Installing Magick ... \n" ${Color_Off}

	if ! [ $(which magick) ]; then 
		$RECOMMEND_INSTALL magick

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Magick is successfully Installed.\n" ${Color_Off}

	fi

##### w3m for ranger preview image

	echo -e ${BBlue}"\n[*] Installing W3m ... \n" ${Color_Off}

	if ! [ $(which w3m) ]; then 
		$RECOMMEND_INSTALL w3m

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] W3m is successfully Installed.\n" ${Color_Off}

	fi


############### Themes ###############

########## GTK ################

	echo -e ${BBlue}"\n[*] Installing Gtk ... \n" ${Color_Off}

	$RECOMMEND_INSTALL gtk3 gtk4

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Gtk is successfully Installed.\n" ${Color_Off}


	##########  lxappearance, qt5ct - Tool change theme ##########


	echo -e ${BBlue}"\n[*] Installing Lxappearance ... \n" ${Color_Off}

	if ! [ $(which lxappearance) ]; then 
		$RECOMMEND_INSTALL lxappearance

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Lxappearance is successfully Installed.\n" ${Color_Off}

	fi


	echo -e ${BBlue}"\n[*] Installing Qt5ct ... \n" ${Color_Off}

	if ! [ $(which qt5ct) ]; then
		$RECOMMEND_INSTALL qt5ct	

	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Qt5ct is successfully Installed.\n" ${Color_Off}

	fi

	########## gtk-engine-murrine - Require Tool ##########

	echo -e ${BBlue}"\n[*] Installing Magick ... \n" ${Color_Off}

	$RECOMMEND_INSTALL gtk-engine-murrine
	SETTIMEOUT "" 1s

	echo -e ${BGreen}"[*] Magick is successfully Installed.\n" ${Color_Off}


	########## material-black-theme - gtk theme ##########

	echo -e ${BBlue}"\n[*] Installing Material-Black-Theme ... \n" ${Color_Off}

	$YAYINSTALL material-black-colors-theme

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Material-Black-Theme is successfully Installed.\n" ${Color_Off}



	########## Candy-icons - Icon theme ##########
	echo -e ${BBlue}"\n[*] Installing Candy-icons ... \n" ${Color_Off}

	$YAYINSTALL candy-icons-git

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Candy-icons is successfully Installed.\n" ${Color_Off}



	########## Sweet-cursors-theme - Cursor theme ##########
	echo -e ${BBlue}"\n[*] Installing Sweet-cursors-theme ... \n" ${Color_Off}

	$YAYINSTALL sweet-cursors-theme-git

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Sweet-cursors-theme is successfully Installed.\n" ${Color_Off}


}



# Run main function

main "$@"


