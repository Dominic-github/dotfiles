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

function MoveXProfile(){
	LISTX11FILE=$(ls -A $HOME/.dotfiles/.config/X11)

	for name in $LISTX11FILE
	do
		cp -a $HOME/.dotfiles/.config/X11/name $HOME
		echo ""
		echo "Move $HOME/.dotfiles/.config/X11/$name to $HOME successfully"
		echo ""

	done

}

function ContainerPacket(){
	LISTDIRCONFIG=$(ls -A $HOME/.dotfiles/.config)

echo "
===============================
       Setting up config...
===============================
"
	MoveXProfile

	for name in $LISTDIRCONFIG
	do
		msg"======= Symlink $name ======="

		MoveNewConfig "$name"
	done

}


function SetUpPacket(){


if [[ "$SHELL" != "/usr/bin/fish" ]];then
echo ""
echo "
====================================
     	Make default fish
====================================
"
chsh -s /usr/bin/fish
	if [[ "$SHELL" == "/usr/bin/fish" ]]; then
	echo ""
	echo "Success"
	echo ""
	fi
fi


if test ! -f  $HOME/.config/systemd/user/default.target.wants/pulseaudio.service && test ! -f $HOME/.config/systemd/user/sockets.target.wants/pulseaudio.socket; then
echo ""
echo "
====================================
       System enable lightdm...
====================================
"
systemctl --user enable pulseaudio
	if test -f  $HOME/.config/systemd/user/default.target.wants/pulseaudio.service && test -f $HOME/.config/systemd/user/sockets.target.wants/pulseaudio.socket; then
	echo ""
	echo "Success"
	echo ""
	fi
fi



if test ! -f /etc/systemd/system/sleep.target.wants/betterlockscreen.$USER.service] && test ! -f /etc/systemd/system/suspend.target.wants/betterlockscreen@$USER.service; then
echo ""
echo "
====================================
  System enable betterlockscreen...
====================================
"
echo ""
sudo systemctl enable betterlockscreen@$USER
	if test -f /etc/systemd/system/sleep.target.wants/betterlockscreen.$USER.service && test -f /etc/systemd/system/suspend.target.wants/betterlockscreen@$USER.service; then
	echo ""
	echo "Success"
	echo ""
	fi
fi




if test ! -f /etc/systemd/system/display-manager.service; then
echo ""
echo "
====================================
       System enable lightdm...
====================================
"
echo ""
sudo systemctl enable lightdm.service
	if test -f /etc/systemd/system/display-manager.service; then
	echo ""
	echo "Success"
	echo ""
	fi
fi


if test ! -f /var/lib/AccountsService/icons/default-user.png; then
echo "
====================================
          Avatar Account
====================================
"
	sudo cp $HOME/.dotfiles/image/logo/default-user.png /var/lib/AccountsService/icons/
	sudo sh -c "echo "Icon=/var/lib/AccountsService/icons/default-user.png" >> /var/lib/AccountsService/users/$(whoami)"
echo ""
	if test -f /var/lib/AccountsService/icons/default-user.png; then
echo ""
echo "Success"
echo ""
	fi
fi

}


function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function MoveNewConfig(){
	local NamePacket="$1" 

	if [[ "$NamePacket" == "nvim" ]]; then
		continue
	else
		cp -a $HOME/.dotfiles/.config/$NamePacket $HOME/.config/
		echo ""
		echo "Move $HOME/.dotfiles/.config/$NamePacket to $HOME/.config/$NamePacket successfully"
		echo ""

	fi
}

function RemoveOldConfig(){
	LISTDIRCONFIGCURRENT=$(ls -A $HOME/testdotfile)

	for name in $LISTDIRCONFIGCURRENT
	do
		if [[ "$name" == "nvim" ]]; then
			continue
		else
			rm -rf $HOME/.config/$name
			echo ""
			echo "Remove $HOME/.config/$name successfully"
			echo ""
		fi
	done
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
					echo ""
					echo "Move $HOME/.config to $HOME/.old-config-$DIRCONFIGNUMBER successfully"
					echo ""
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

