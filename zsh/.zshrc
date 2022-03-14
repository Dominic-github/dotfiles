#zmodload zsh/zprof

# default apps
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave-nightly"


# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your Starship custom
eval "$(starship init zsh)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.yaml

# Use dotfile as ZSH custom directory
ZSH_CUSTOM=$DOTFILES/zsh

# Active environment
. $DOTFILES/zsh/env.sh

# Active neofetch
neofetch



