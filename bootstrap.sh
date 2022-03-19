#!/bin/sh

echo "Setting up your Pc"


# Make FISH the default shell environment
chsh -s /usr/bin/fish


# Install VimPlug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install 

echo "Installing lunarvim..."
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

echo "Installing Starship..."
cargo install starship --locked

echo "Setting up config..."

# Symlink fish
rm -rf $HOME/.config/fish
cp -a $HOME/.dotfiles/.config/fish $HOME/.config

# Symlink neovim
rm -rf $HOME/.config/nvim/
cp -a $HOME/.dotfiles/.config/nvim $HOME/.config

# Symlink lunarvim
rm -rf $HOME/.config/lvim/
cp -a $HOME/.dotfiles/.config/lvim $HOME/.config

# Symlink starship
rm -rf $HOME/.config/starship.toml
cp -a $HOME/.dotfiles/.config/starship $HOME/.config

# Symlink alacritty
rm -rf $HOME/.config/kitty
cp -a $HOME/.dotfiles/.config/kitty $HOME/.config

# Symlink font
sudo mkdir -p /usr/local/share/fonts/RobotoMono
sudo cp -a $HOME/fonts/RobotoMono /usr/local/share/fonts/
sudo cp -a $HOME/fonts/FiraCode /usr/local/share/fonts/
sudo fc-cache -f

# Symlink polybar 
rm -rf $HOME/.config/polybar
cp -a $HOME/.dotfiles/.config/polybar $HOME/.config
chmod +x $HOME/.config/polybar/launch.sh

# Symlink rofi
rm -rf $HOME/.config/rofi
cp-a $HOME/.dotfiles/.config/rofi $HOME/.config

# Symlink i3-gaps
rm -rf $HOME/.config/i3
cp -a $HOME/.dotfiles/.config/i3 $HOME/.config

# Symlink picom
rm -rf $HOME/.config/picom
cp -a $HOME/.dotfiles/.config/picom $HOME/.config

# Symlink neofetch
rm -rf $HOME/.config/neofetch
cp -a $HOME/.dotfiles/.config/neofetch $HOME/.config

# Add tools 
cp -a $HOME/.config/tools $HOME/.config

# Add ranger with icon
ranger --copy-config=all
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf
echo "set preview_images true" >> $HOME/.config/ranger/rc.conf


echo "Done. Enjoy!"