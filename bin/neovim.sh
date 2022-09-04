#!/bin/bash


if [[ "$SHELL" == "/usr/bin/fish" ]];then

	bash (curl -s https://raw.githubusercontent.com/Frey1a/nvim/main/bin/install.sh | psub)

else

	bash <(curl -s https://raw.githubusercontent.com/Frey1a/nvim/main/bin/install.sh)

fi
