echo "Install packages..." 

#directory containing git clone
mkdir ~/git-clone
mkdir -p ~/Pictures/Screenshots

#Pacman for windows
echo "Install i3 - desktop manager..."
sudo pacman -S i3 git fish rofi picom feh neofetch w3m imagemagick pamixer nemo kitty brightnessctl xclip ranger neovim ccls nodejs yarn npm python3-dev lazygit

# echo "Install git..."
# sudo pacman -S git

# echo "Install fish shell..."
# sudo pacman -S fish

# echo "Install rofi..."
# sudo pacman -S rofi

# echo "Install picom..."
# sudo pacman -S picom

# echo "Install feh..."
# sudo pacman -S feh

# echo "Install neofetch..."
# sudo pacman -S neofetch

# echo "Install w3m..."
# sudo pacman -S w3m

# echo "Install imagemagick"
# sudo pacman -S imagemagick

# echo "Install Pamixer..."
# sudo pacman -S pamixer

# echo "Install nemo - file manager..."
# sudo pacman -S nemo
# # sudo pacman -S alacritty

# echo "Install kitty"
# sudo pacman -S kitty     # It's same alacritty but you can set image on neofetch and icon

# # for backlight
# echo "Install brightnessctl..."
# sudo pacman -S brightnessctl

# # for print screenshot
# echo "Install xclip..."
# sudo pacman -S xclip

# echo "Install ranger..." 
# sudo pacman -S ranger 

# #for neovim

# echo "Install neovim..."
# sudo pacman -S neovim

# echo "Install ccls..."
# sudo pacman -S ccls

# echo "Install nodejs..."
# sudo pacman -S nodejs

# echo "Install yarn..."
# sudo pacman -S yarn

# echo "Install npm..."
# sudo pacman -S npm 

# echo "Install python3-dev..."
# sudo pacman -S python3-dev

# echo "Install lazygit..."
# sudo pacman -S lazygit



#yay 

    # Check for yay and install if we don't have it
if test ! $(which yay); then
   sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/git-clone/yay && cd ~/git-clone/yay && makepkg -si && cd ~
fi
echo "Install i3lock-color..."
yay -S i3lock-color polybar brave-nightly betterlockscreen lightdm-webkit-theme-aether lolcat logo-ls

# echo "Install polybar..."
# yay -S polybar

# echo "Install brave-nightly..."
# yay -S brave-nightly

# echo "Install betterlockscreen..."
# yay -S betterlockscreen

# echo "Install lightdm-webkit-theme-aether..."
# yay -S lightdm-webkit-theme-aether

# echo "Install lolcat..."
# yay -S lolcat 

# echo "Install logo-ls..."
# yay -S logo-ls

echo "System enable betterlockscreen..."
sudo systemctl enable betterlockscreen@USER

echo "System enable lightdm"
sudo systemctl enable lightdm.service


bash ~/.dotfiles/bootstrap.sh