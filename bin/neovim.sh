#!/bin/bash


if [[ "$SHELL" == "/usr/bin/fish" ]];then

	bash (curl -s https://raw.githubusercontent.com/Dominic-github/nvim-lua/main/bin/install.sh | psub)

else

	bash <(curl -s https://raw.githubusercontent.com/Dominic-github/nvim-lua/main/bin/install.sh)

fi
