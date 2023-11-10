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





function ContainerPacket(){

	LISTDIRCONFIG=$(ls -A $HOME/.dotfiles/.config)

echo -e ${BBlue}"
===============================
      Setting up config...
===============================
" ${Color_Off}


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
          Enable Fonts ...
====================================
" ${Color_Off}

		mkdir ~/.local/share/fonts/
if ! [ -d  $HOME/.local/share/fonts/FiraCode ] &&  ! [ -d $HOME/.local/share/fonts/FiraMono ] ; then

		cp -a $HOME/.dotfiles/fonts/FiraCode $HOME/.local/share/fonts/
		cp -a $HOME/.dotfiles/fonts/FiraMono $HOME/.local/share/fonts/
		fc-cache -fv

    if  [ -d  $HOME/.local/share/fonts/FiraCode ] &&   [ -d $HOME/.local/share/fonts/FiraMono ] ; then
		  SETTIMEOUT "" 1s
		  echo -e ${BGreen}"[*] Enable fonst is success.\n" ${Color_Off}
    fi
fi


echo -e ${BBlue}"
====================================
          Enable sddm...
====================================
" ${Color_Off}

	sudo systemctl enable sddm

	sudo mkdir /etc/sddm.conf.d/
  sudo rm -rf /etc/sddm.conf.d/sddm.conf
  sudo cp $HOME/.dotfiles/.sddm-config/sddm.conf /etc/sddm.conf.d/sddm.conf

	sudo mkdir /usr/share/sddm/themes/
  sudo rm -rf /usr/share/sddm/themes/Sugar-Candy
  sudo cp -a $HOME/.dotfiles/.sddm-config/Sugar-Candy /usr/share/sddm/themes/

if  [ -f /etc/sddm.conf.d/sddm.conf ] &&  [ -d /usr/share/sddm/themes/Sugar-Candy ] ; then
		  SETTIMEOUT "" 1s
		  echo -e ${BGreen}"[*] Enable sddm is success.\n" ${Color_Off}
fi



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

	  
  _ _ _  __        __               _               _ _ _ 
 | | | | \ \      / /_ _ _ __ _ __ (_)_ __   __ _  | | | |
 | | | |  \ \ /\ / / _` | '__| '_ \| | '_ \ / _` | | | | |
 |_|_|_|   \ V  V / (_| | |  | | | | | | | | (_| | |_|_|_|
 (_|_|_)    \_/\_/ \__,_|_|  |_| |_|_|_| |_|\__, | (_|_|_)
                                            |___/         

EOF

)" ${Color_Off}



}

function print_enjoy(){

	echo -e ${Green}"
	$(cat <<'EOF'
	
  _____ _   _     _  _____   __
 | ____| \ | |   | |/ _ \ \ / /
 |  _| |  \| |_  | | | | \ V / 
 | |___| |\  | |_| | |_| || |  
 |_____|_| \_|\___/ \___/ |_|  

                               
# author: Dominic-github
# github: https://github.com/Dominic-github


You need to reboot !!!

EOF

)" ${Color_Off}


}

# Run main function
main "$@"

