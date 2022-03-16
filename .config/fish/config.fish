# You may need to manually set your language environment
set -gx LC_ALL=en_US.UTF-8
set -gx LANG=en_US.UTF-8
set -gx EDITOR="nvim"
set -gx TERMINAL="alacritty"
set -gx BROWSER="brave-nightly"



# Path to your Starship custom
starship init fish | source
set -gx STARSHIP_CONFIG=$HOME/.config/starship/starship.toml


# Active neofetch
neofetch