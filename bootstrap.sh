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

# Symlink zshrc
rm -rf $HOME/.config/fish
cp -a $HOME/.dotfiles/.config/fish $HOME/.config/fish

# Symlink neovim
rm -rf $HOME/.config/nvim/
cp -a $HOME/.dotfiles/.config/nvim $HOME/.config/nvim/

# Symlink lunarvim
rm -rf $HOME/.config/lvim/
cp -a $HOME/.dotfiles/.config/lvim $HOME/.config/lvim/

# Symlink starship
rm -rf $HOME/.config/starship.toml
cp -a $HOME/.dotfiles/.config/starship $HOME/.config/starship

# Symlink alacritty
rm -rf $HOME/.config/alacritty
cp -a $HOME/.config/alacritty $HOME/.config/alacritty

# Symlink font
sudo mkdir -p /usr/local/share/fonts/RobotoMono
sudo cp -a $HOME/fonts/RobotoMono $HOME /usr/local/share/fonts/RobotoMono
sudo fc-cache -f




echo "Done. Enjoy!"