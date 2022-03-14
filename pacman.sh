#Pacman 
sudo pacman -S git 
sudo pacman -S zsh
sudo pacman -S alacritty

#for neovim
sudo pacman -S neovim
sudo pacman -S ccls 
sudo pacman -S nodejs
sudo pacman -S yarn
sudo pacman -S npm 
sudo pacman -S python3-dev
sudo pacman -S lazygit

#for lunarvim
sudo pacman -S cargo

#yay 
yay -S polybar



cd $HOME/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh