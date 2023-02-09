# Kitty

![kitty](./kitty.jpg)

## Install [_kitty_](https://sw.kovidgoyal.net/kitty/) :

```bash
sudo pacman -S kitty
```

and dependence:

> You need to install [Aur helper](https://wiki.archlinux.org/index.php/AUR_helpers)

```bash
# A command-line system information tool
sudo pacman -S neofetch

# Font
yay -S nerd-fonts-fira-code
yay -S nerd-fonts-roboto-mono
yay -S ttf-material-design-icons
```

## Copy my config:

```bash
git clone https://github.com/Dominic-github/dotfiles.git --depth 1
cp -a dotfiles/.config/kitty ~/.config
rm -rf dotfiles
```
