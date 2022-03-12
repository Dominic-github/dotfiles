#!/bin/sh

echo "Setting up your Pc"


# Check for Homebrew and install if we don't have it
if test ! $(which yay); then
   pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
fi



# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp $HOME/.dotfiles/themes/nt9.zsh-theme $HOME/.oh-my-zsh/themes/

# Install VimPlug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install 
echo "Installiing ..."


echo "Installing ..."




echo "Setting up symlink..."

# Symlink zshrc
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc



# Symlink neovim
rm -rf $HOME/.config/nvim/init.vim
mkdir -p .config/nvim
ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim/






# https://stackoverflow.com/questions/43433542/stuck-at-android-repositories-cfg-could-not-be-loaded
touch ~/.android/repositories.cfg

# Default Mac settings

chmod +x ./macos/setup.sh
./macos/setup.sh

echo "Done. Enjoy!"