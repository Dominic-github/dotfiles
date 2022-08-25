#!/bin/bash

declare DOTFILE_REMOTE="https://github.com/Frey1a/dotfiles.git" 

declare BASEDIR=$HOME

declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1

function SETTIMEOUT(){
	msg "$1"
	timeout 5s bash <<EOT
	sleep 10
EOT
}

function nextStep(){
	bash ~/.dotfiles/pacman.sh
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}


function main(){

	print_logo

	detect_platform

	checkGit

	cloneDotFiles

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


function checkGit(){
echo "
=============================
|     	     Git             |
==============================
"
	if test ! $(which git); then 
		$RECOMMEND_INSTALL git
	else
		echo "git is successfully installed"
	fi

}

function cloneDotFiles(){

	if test ! -d $HOME/.dotfiles;then
		msg "Cloning dotfile "
		git clone $DOTFILE_REMOTE $HOME/.dotfiles

		if test -d $HOME/.dotfiles;then
			echo "Cloning is successfully"
		else
			echo ""
			echo "Failed to clone repository. Installation failed."
			echo ""
			exit 1
		fi
	else
			echo ""
		echo "Failed to clone repository. '~/.dotfiles' folder already exists"
			echo ""
		exit 1
	fi
}




function print_logo() {
  cat <<'EOF'

	██████╗░░█████╗░████████╗███████╗██╗██╗░░░░░███████╗░██████╗
	██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║░░░░░██╔════╝██╔════╝
	██║░░██║██║░░██║░░░██║░░░█████╗░░██║██║░░░░░█████╗░░╚█████╗░
	██║░░██║██║░░██║░░░██║░░░██╔══╝░░██║██║░░░░░██╔══╝░░░╚═══██╗
	██████╔╝╚█████╔╝░░░██║░░░██║░░░░░██║███████╗███████╗██████╔╝
	╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚═╝╚══════╝╚══════╝╚═════╝░

# author: Frey1a
# github: https://github.com/Frey1a
EOF
}

# Run main function
main "$@"


