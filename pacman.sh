echo "
====================================
        Install packages...
====================================
" 

#directory containing git clone
mkdir ~/git-clone
mkdir -p ~/Pictures/Screenshots

#Pacman for windows
echo "
====================================
   Install i3 - desktop manager...
====================================
"
sudo pacman -S i3

echo "
====================================
            Install git...
====================================
"
sudo pacman -S git

echo "
====================================
        Install fish shell...
====================================
"
sudo pacman -S fish

echo "
====================================
           Install rofi...
====================================
"
sudo pacman -S rofi

echo "
====================================
           Install picom...
====================================
"
sudo pacman -S picom

echo "
====================================
            Install feh...
====================================
"
sudo pacman -S feh

echo "
====================================
         Install neofetch...
====================================
"
sudo pacman -S neofetch

echo "
====================================
           Install w3m...
====================================
"
sudo pacman -S w3m

echo "
====================================
       Install imagemagick...
====================================
"
sudo pacman -S imagemagick

echo "
====================================
         Install Pamixer...
====================================
"
sudo pacman -S pamixer

echo "
====================================
   Install nemo - file manager...
====================================
"
sudo pacman -S nemo
# sudo pacman -S alacritty

echo "
====================================
            Install kitty
====================================
"
sudo pacman -S kitty     # It's same alacritty but you can set image on neofetch and icon

# for backlight
echo "
====================================
       Install brightnessctl...
====================================
"
sudo pacman -S brightnessctl

# for print screenshot
echo "
====================================
        Install xclip,maim...
====================================
"
sudo pacman -S xclip
sudo pacman -S maim

echo "
====================================
          Install ranger...
====================================
" 
sudo pacman -S ranger 

#for neovim

echo "
====================================
          Install neovim...
====================================
"
sudo pacman -S neovim

echo "
====================================
           Install ccls...
====================================
"
sudo pacman -S ccls

echo "
====================================
          Install nodejs...
====================================
"
sudo pacman -S nodejs

echo "
====================================
           Install yarn...
====================================
"
sudo pacman -S yarn

echo "
====================================
            Install npm...
====================================
"
sudo pacman -S npm 

echo "
====================================
        Install python3-dev...
====================================
"
sudo pacman -S python3

echo "
====================================
          Install lazygit...
====================================
"
sudo pacman -S lazygit

echo "
====================================
          Install polybar...
====================================
"
sudo pacman -S polybar


#fonts
  #see japanese and emoji
sudo pacman -S noto-fonts-cjk 
sudo pacman -S noto-fonts-emoji 
sudo pacman -S noto-fonts

#audio
sudo pacman -S pulseaudio

# Some to neovim
sudo pacman -S ctags


