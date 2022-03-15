echo "Install packages..." 

#directory containing git clone
mkdir ~/git-clone

#Pacman 
sudo pacman -S git
sudo pacman -S fish 
sudo pacman -S alacritty
sudo pacman -S picom
sudo pacman -S rofi
sudo pacman -S feh

#for neovim
sudo pacman -S neovim
sudo pacman -S ccls 
sudo pacman -S nodejs
sudo pacman -S yarn
sudo pacman -S npm 
sudo pacman -S python3-dev
sudo pacman -S lazygit



#yay 

    # Check for yay and install if we don't have it
if test ! $(which yay); then
   sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/git-clone/yay && cd ~/git-clone/yay && makepkg -si && cd ~
fi

yay -S polybar
yay -S brave-nightly





cd $HOME/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh