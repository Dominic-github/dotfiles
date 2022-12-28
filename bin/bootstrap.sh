#!/bin/bash


# =============================================================

function main() {

if confirm "Would you like to REMOVE current config file"; then
	RemoveOldConfig
else
	SaveOldConFig
fi

	ContainerPacket

	SetUpPacket

	FristRunAfterInstall
	
	print_enjoy
}


# =============================================================


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
  local div_width="60"
  echo -e ${BPurple}$(printf "%${div_width}s\n" ' ' | tr ' ' -) ${Color_Off}
  echo -e ${BYellow}"[!] $(printf "%s\n" "$text")" ${Color_Off}
  echo -e ${BPurple}$(printf "%${div_width}s\n" ' ' | tr ' ' -) ${Color_Off}
}



function MoveXProfile(){

	LISTX11FILE=$(ls -A $HOME/.dotfiles/.config/X11)
	for name in $LISTX11FILE
	do
		echo -e ${BBlue}"[*] Installing $name configs..." ${Color_Off}

		cp -a $HOME/.dotfiles/.config/X11/$name $HOME
		if [ -f $HOME/$name ];then
		SETTIMEOUT "" 1s
		echo  -e ${BGreen}"[*] Move $HOME/.dotfiles/.config/X11/$name to $HOME success" ${Color_Off}
		fi
	done

}


function ContainerPacket(){

	LISTDIRCONFIG=$(ls -A $HOME/.dotfiles/.config)

echo -e ${BBlue}"
===============================
      Setting up config...
===============================
" ${Color_Off}

	# X11 config
	MoveXProfile

	for name in $LISTDIRCONFIG
	do
		echo -e ${BBlue}"[*] Installing $name configs..." ${Color_Off}

		SETTIMEOUT "" 1s

		MoveNewConfig "$name"

	done

}


function SetUpPacket(){


echo -e ${BBlue}"
====================================
       System enable Fish ...
====================================
" ${Color_Off}

if [[ "$SHELL" != "/usr/bin/fish" ]];then

chsh -s /usr/bin/fish
	if [[ "$SHELL" == "/usr/bin/fish" ]]; then
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Enable Fish is success.\n" ${Color_Off}

	fi
else
		echo -e ${BGreen}"[*] Enable Fish is success .\n" ${Color_Off}

fi



echo -e ${BBlue}"
====================================
          Enable Rofi ...
====================================

" ${Color_Off}

if [ -d $HOME/.config/rofi/.github  ];then
	bash $HOME/.config/rofi/.github/setup.sh

	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Enable Rofi is success.\n" ${Color_Off}

fi


echo -e ${BBlue}"
====================================
    System enable Pulseaudio...
====================================
" ${Color_Off}


if ! [ -f  $HOME/.config/systemd/user/default.target.wants/pulseaudio.service ] &&  ! [ -f $HOME/.config/systemd/user/sockets.target.wants/pulseaudio.socket ] ; then

	systemctl --user enable pulseaudio

	if [ -f  $HOME/.config/systemd/user/default.target.wants/pulseaudio.service ] && [ -f $HOME/.config/systemd/user/sockets.target.wants/pulseaudio.socket ]; then
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Enable Pulseaudio is success.\n" ${Color_Off}

	fi
fi


echo -e ${BBlue}"
====================================
  System enable betterlockscreen...
====================================
" ${Color_Off}

if ! [ -f /etc/systemd/system/sleep.target.wants/betterlockscreen@$USER.service ] && ! [ -f /etc/systemd/system/suspend.target.wants/betterlockscreen@$USER.service ]; then


sudo cp -a $HOME/.dotfiles/.config/betterlockscreen/betterlockscreen@$USER.service /etc/systemd/system/suspend.target.wants/

sudo cp -a $HOME/.dotfiles/.config/betterlockscreen/betterlockscreen@$USER.service /etc/systemd/system/sleep.target.wants/

	if  [ -f /etc/systemd/system/sleep.target.wants/betterlockscreen@$USER.service ] && [ -f /etc/systemd/system/suspend.target.wants/betterlockscreen@$USER.service ]; then

		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Enable Betterlockscreen is success .\n" ${Color_Off}

	fi
fi



echo -e ${BBlue}"
====================================
       System enable lightdm...
====================================
" ${Color_Off}

if ! [ -f /etc/systemd/system/display-manager.service ]; then

sudo systemctl enable lightdm.service

	if [ -d /etc/lightdm ]; then

		sudo cp -a $HOME/.dotfiles/.config/lightdm-aether-config/* /etc/lightdm

	fi

	if [ -f /etc/systemd/system/display-manager.service ]; then
	
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Enable Lightdm is success .\n" ${Color_Off}

	fi
fi



echo -e ${BBlue}"
====================================
       Set Avatar Account ...
====================================
" ${Color_Off}


if ! [ -f /var/lib/AccountsService/icons/default-user.png ]; then


	# echo "Move default-user.png.\n"
	sudo cp -a $HOME/.dotfiles/image/logo/default-user.png /var/lib/AccountsService/icons/

	if ! [ "$(sudo grep -rnw /var/lib/AccountsService/users/$(whoami) -e "Icon=/var/lib/AccountsService/icons/default-user.png")" ]; then

	# echo "Set default-user.png => Logo.\n'"
		sudo sh -c "echo "Icon=/var/lib/AccountsService/icons/default-user.png" >> /var/lib/AccountsService/users/$(whoami)"

	fi

	if [ -f /var/lib/AccountsService/icons/default-user.png ]; then

		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Avatar is success .\n" ${Color_Off}

	fi

fi

}

function FristRunAfterInstall(){

	echo -e ${BBlue}"[*] Add fonts for rofi.\n" ${Color_Off}
	bash $HOME/.config/rofi/.github/setup.sh
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Fonts is success.\n" ${Color_Off}

	echo -e ${BBlue}"[*] Set background.\n" ${Color_Off}
	feh --bg-fill $HOME/.dotfiles/image/1366x786/340105.jpg 
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Set background is success.\n" ${Color_Off}

	echo -e ${BBlue}"[*] Set background betterlockscreen.\n" ${Color_Off}
	betterlockscreen -u $HOME/.dotfiles/image/1366x786/340105.jpg dimblur
	SETTIMEOUT "" 1s
	echo -e ${BGreen}"[*] Set background is success.\n" ${Color_Off}

}



function MoveNewConfig(){
	local NamePacket="$1" 

	if [[ "$NamePacket" == "nvim" ]]; then
		continue
	else
		cp -a $HOME/.dotfiles/.config/$NamePacket $HOME/.config/

		if [  -d $HOME/.config/$NamePacket ]; then
			SETTIMEOUT "" 1s
			echo -e ${BGreen}"[*] $NamePacket is success Installed.\n" ${Color_Off}

		else
			SETTIMEOUT "" 1s
			echo -e ${BRed}"[!] Move $HOME/.dotfiles/.config/$NamePacket to $HOME/.config/$NamePacket failed.\n" ${Color_Off}

		fi

	fi
}

function RemoveOldConfig(){
	LISTDIRCONFIGCURRENT=$(ls -A $HOME/.config)

	for name in $LISTDIRCONFIGCURRENT
	do
		if [[ "$name" == "nvim" ]]; then
			continue
		else
			echo -e ${BBlue}"[*] Removing $name configs..." ${Color_Off}
			rm -rf $HOME/.config/$name

			if ! [  -d $HOME/.config/$name ]; then

				SETTIMEOUT "" 1s
				echo -e ${BGreen}"[*] Remove $HOME/.config/$name success.\n" ${Color_Off}

			else

				SETTIMEOUT "" 1s
				echo -e ${BRed}"[!] Remove $HOME/.config/$name failed.\n" ${Color_Off}

			fi
		fi
	done
}

function SaveOldConFig(){

	echo -e ${BBlue}"\n[*] Save Current Config ...\n" ${Color_Off}

	DIRCONFIGNUMBER=1
	if [  -d $HOME/.config ];then
		until false;

		do
			if ! [ -d $HOME/.old-config-$DIRCONFIGNUMBER ]; then
				mkdir $HOME/.old-config-$DIRCONFIGNUMBER

				if [ -d $HOME/.old-config-$DIRCONFIGNUMBER ];then

					mv  $HOME/.config $HOME/.old-config-$DIRCONFIGNUMBER

					mkdir $HOME/.config
					
					SETTIMEOUT "" 1s
					echo -e ${BGreen}"[*]Move $HOME/.config to $HOME/.old-config-$DIRCONFIGNUMBER success.\n" ${Color_Off}

				else
					# Remove file if not success
					rm -rf $HOME/.old-config-$DIRCONFIGNUMBER
				fi

				break

			else

			DIRCONFIGNUMBER=`expr $DIRCONFIGNUMBER + 1`

			fi
		done

	fi
}

function confirm() {
  local question="$1"
  while true; do
	print_warning
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




function print_warning(){


echo -e ${BYellow}"
$(cat <<'EOF'

	  
██╗██╗██╗  ░██╗░░░░░░░██╗░█████╗░██████╗░███╗░░██╗██╗███╗░░██╗░██████╗░  ██╗██╗██╗
██║██║██║  ░██║░░██╗░░██║██╔══██╗██╔══██╗████╗░██║██║████╗░██║██╔════╝░  ██║██║██║
██║██║██║  ░╚██╗████╗██╔╝███████║██████╔╝██╔██╗██║██║██╔██╗██║██║░░██╗░  ██║██║██║
╚═╝╚═╝╚═╝  ░░████╔═████║░██╔══██║██╔══██╗██║╚████║██║██║╚████║██║░░╚██╗  ╚═╝╚═╝╚═╝
██╗██╗██╗  ░░╚██╔╝░╚██╔╝░██║░░██║██║░░██║██║░╚███║██║██║░╚███║╚██████╔╝  ██╗██╗██╗
╚═╝╚═╝╚═╝  ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░╚══╝░╚═════╝░  ╚═╝╚═╝╚═╝

EOF

)" ${Color_Off}



}

function print_enjoy(){

	echo -e ${Green}"
	$(cat <<'EOF'
	
			███████╗███╗░░██╗░░░░░██╗░█████╗░██╗░░░██╗██╗
			██╔════╝████╗░██║░░░░░██║██╔══██╗╚██╗░██╔╝██║
			█████╗░░██╔██╗██║░░░░░██║██║░░██║░╚████╔╝░██║
			██╔══╝░░██║╚████║██╗░░██║██║░░██║░░╚██╔╝░░╚═╝
			███████╗██║░╚███║╚█████╔╝╚█████╔╝░░░██║░░░██╗
			╚══════╝╚═╝░░╚══╝░╚════╝░░╚════╝░░░░╚═╝░░░╚═╝

# author: Frey1a
# github: https://github.com/Frey1a

EOF

)" ${Color_Off}


}

# Run main function
main "$@"

