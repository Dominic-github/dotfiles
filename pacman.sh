echo "Install packages..." 

#directory containing git clone
mkdir ~/git-clone
mkdir -p ~/Pictures/Screenshots

#Pacman for windows
sudo pacman -S i3
sudo pacman -S git
sudo pacman -S fish 
sudo pacman -S picom
sudo pacman -S rofi
sudo pacman -S feh
sudo pacman -S neofetch
sudo pacman -S w3m
sudo pacman -S imagemagick
# sudo pacman -S alacritty
sudo pacman -S kitty     # It's same alacritty but you can set image on neofetch and icon
# for backlight
sudo pacman -S brightnessctl
# for print screenshot
sudo pacman -S xclip
sudo pacman -S 

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
yay -S i3lock-color
yay -S polybar
yay -S brave-nightly
yay -S betterlockscreen
yay -S lightdm-webkit-theme-aether
yay -S lolcat 

sudo systemctl enable betterlockscreen@USER 
sudo systemctl enable lightdm.service


cd $HOME/.dotfiles
chmod +x bootstrap.sh
./bootstrap.sh