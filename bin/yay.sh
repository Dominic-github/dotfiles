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




#########################################
#                Fonts                  #
#########################################

	########## Noto fonts - japanese ##########
	echo -e ${BBlue}"\n[*] Installing Noto-fonts ... \n" ${Color_Off}

	$RECOMMEND_INSTALL noto-fonts-cjk noto-fonts-emoji noto-fonts

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Noto-fonts is successfully Installed.\n" ${Color_Off}


  ## Time new roman
	echo -e ${BBlue}"\n[*] Installing Time new Roman ... \n" ${Color_Off}
  $YAYINSTALL ttf-freefont ttf-ms-fonts ttf-linux-libertine ttf-dejavu ttf-inconsolata ttf-ubuntu-font-family
	echo -e ${BGreen}"[*] Time new Roman is successfully Installed.\n" ${Color_Off}


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


