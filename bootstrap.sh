#!/bin/sh

echo "Setting up your Pc"


# Make ZSH the default shell environment
chsh -s $(which zsh)


# Install VimPlug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install 
echo "Installiing brave-nightly..."
yay -S brave-nightly


echo "Installing lunarvim..."
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

echo "Installing Starship..."
cargo install starship --locked



echo "Setting up config..."

# Symlink zshrc
rm -rf $HOME/.zshrc
cp -a $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

# Symlink neovim
rm -rf $HOME/.config/nvim/
cp -a $HOME/.dotfiles/.config/nvim $HOME/.config/nvim/

# Symlink lunarvim
rm -rf $HOME/.config/lvim/
cp -a $HOME/.dotfiles/.config/lvim $HOME/.config/lvim/

# Symlink starship
rm -rf $HOME/.config/starship.toml
cp -a $HOME/.dotfiles/.config/starship.toml $HOME/.config/starship.toml

echo "Install packages..."


echo "Done. Enjoy!"