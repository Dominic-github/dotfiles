# StarShip

## Install [_starship_](https://starship.rs/)

> You need to install [Aur helper](https://wiki.archlinux.org/index.php/AUR_helpers)

```bash
yay -S starship
```

## Copy my config:

```bash
git clone https://github.com/Frey1a/dotfiles.git
cp -a dotfiles/.config/starship ~/.config/starship
rm -rf dotfiles
```

## Setup

Change path config and always run on terminal

- You can change default configuration file location with STARSHIP_CONFIG environment variable:

```bash
export STARSHIP_CONFIG=~/example/non/default/path/starship.toml
```

- Equivalently in PowerShell (Windows) would be adding this line to your $PROFILE:

```bash
$ENV:STARSHIP_CONFIG = "$HOME\example\non\default\path\starship.toml"
```

## More configuration

Go [Here](https://starship.rs/config/)
