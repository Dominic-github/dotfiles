#!/bin/sh

echo "Downloading dotfiles"
curl -LJO 
echo "Unziping dotfiles and start..."
unzip -a dotfiles-master.zip
mv -f dotfiles-master .dotfiles
rm dotfiles-master.zip

cd $HOME/.dotfiles
chmod +x pacman.sh
./pacman.sh