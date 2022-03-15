# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave-nightly"



# Path to your Starship custom
starship init fish | source
export STARSHIP_CONFIG=$HOME/.config/starship/starship.yaml


# Active neofetch
neofetch