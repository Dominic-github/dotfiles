#!/bin/bash

declare BASEDIR=$HOME

function SETTIMEOUT(){
	msg "$1"
	timeout 5s bash <<EOT
	sleep 10
EOT
}


function main() {

if confirm "Would you like to REMOVE current config file"; then
	RemoveOldConfig
else
	SaveOldConFig
fi
	
	ContainerPacket

	SetUpPacket
	
	print_enjoy
}

function ContainerPacket(){
	LISTDIRCONFIG=$(ls -a $HOME/.dotfiles/.config)

echo "
===============================
       Setting up config...
===============================
"

	for name in $LISTDIRCONFIG
	do
		msg"======= Symlink $name ======="
		moveConfig "$name"
	done

}


function SetUpPacket(){

echo "
====================================
     	Make default fish
====================================
"

chsh -s /usr/bin/fish


echo "
====================================
       System enable lightdm...
====================================
"
systemctl --user enable pulseaudio


echo "
====================================
  System enable betterlockscreen...
====================================
"
sudo systemctl enable betterlockscreen@$USER

echo "
====================================
       System enable lightdm...
====================================
"
sudo systemctl enable lightdm.service

echo "
====================================
          Avatar Account
====================================
"
sudo cp $HOME/.dotfiles/image/logo/default-user.png /var/lib/AccountsService/icons/
sudo sh -c "echo "Icon=/var/lib/AccountsService/icons/default-user.png" >> /var/lib/AccountsService/users/$(whoami)"

}


function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"

}

function moveConfig(){
	local NamePacket="$1" 
	cp -a $HOME/.dotfiles/.config/$NamePacket $HOME/.config/

	echo "Move $HOME/.dotfiles/.config/$NamePacket to $HOME/.config/$NamePacket successfully"

}


function RemoveOldConfig(){
	rm -rf $HOME/.config
}

function SaveOldConFig(){

	DIRCONFIGNUMBER=1
	if test -d $HOME/.config;then
		until false;
		do
			if test ! -d $HOME/.old-config-$DIRCONFIGNUMBER; then
				mkdir $HOME/.old-config-$DIRCONFIGNUMBER
				if test -d $HOME/.old-config-$DIRCONFIGNUMBER;then

					mv  $HOME/.config $HOME/.old-config-$DIRCONFIGNUMBER
					mkdir $HOME/.config

				echo "Move $HOME/.config to $HOME/.old-config-$DIRCONFIGNUMBER successfully"
				else
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
       echo "Please answer [y]es or [n]o."
        ;;
    esac
  done

  echo $answer
}



function print_warning(){

	  cat <<'EOF'
	  
██╗██╗██╗  ░██╗░░░░░░░██╗░█████╗░██████╗░███╗░░██╗██╗███╗░░██╗░██████╗░  ██╗██╗██╗
██║██║██║  ░██║░░██╗░░██║██╔══██╗██╔══██╗████╗░██║██║████╗░██║██╔════╝░  ██║██║██║
██║██║██║  ░╚██╗████╗██╔╝███████║██████╔╝██╔██╗██║██║██╔██╗██║██║░░██╗░  ██║██║██║
╚═╝╚═╝╚═╝  ░░████╔═████║░██╔══██║██╔══██╗██║╚████║██║██║╚████║██║░░╚██╗  ╚═╝╚═╝╚═╝
██╗██╗██╗  ░░╚██╔╝░╚██╔╝░██║░░██║██║░░██║██║░╚███║██║██║░╚███║╚██████╔╝  ██╗██╗██╗
╚═╝╚═╝╚═╝  ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝╚═╝░░╚══╝░╚═════╝░  ╚═╝╚═╝╚═╝

EOF
}

function print_enjoy(){
	  cat <<'EOF'
	
			███████╗███╗░░██╗░░░░░██╗░█████╗░██╗░░░██╗██╗
			██╔════╝████╗░██║░░░░░██║██╔══██╗╚██╗░██╔╝██║
			█████╗░░██╔██╗██║░░░░░██║██║░░██║░╚████╔╝░██║
			██╔══╝░░██║╚████║██╗░░██║██║░░██║░░╚██╔╝░░╚═╝
			███████╗██║░╚███║╚█████╔╝╚█████╔╝░░░██║░░░██╗
			╚══════╝╚═╝░░╚══╝░╚════╝░░╚════╝░░░░╚═╝░░░╚═╝

# author: Frey1a
# github: https://github.com/Frey1a

EOF
}

main "$@"

