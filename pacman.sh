
#Pacman 
sudo pacman -S git 
sudo pacman -S zsh
sudo pacman -S alacritty
sudo pacman -S picom

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

# Check for yay and install if we don't have it
if test ! $(which yay); then
   sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi

yay -S polybar
yay -S brave-nightly



cd $HOME/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh