if test ! $(which yay); then
   sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git ~/git-clone/yay && cd ~/git-clone/yay && makepkg -si && cd ~
fi
echo "
====================================
       Install i3lock-color...
====================================
"
yay -S i3lock-color

echo "
====================================
       Install brave-nightly...
====================================
"
yay -S brave-nightly-bin

echo "
====================================
     Install betterlockscreen...
====================================
"
yay -S betterlockscreen

echo "
====================================
 Install lightdm-webkit-theme-aether
====================================
..."
yay -S lightdm-webkit-theme-aether

echo "
====================================
          Install lolcat...
====================================
"
yay -S lolcat 

echo "
====================================
          Install logo-ls...
====================================
"
yay -S logo-ls

echo "
====================================
  System enable betterlockscreen...
====================================
"
sudo systemctl enable betterlockscreen@USER

echo "
====================================
        System enable lightdm
====================================
"
sudo systemctl enable lightdm.service