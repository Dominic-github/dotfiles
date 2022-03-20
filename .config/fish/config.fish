# You may need to manually set 

    set -gx LC_ALL=en_US.UTF-8  
    set -gx LANG=en_US.UTF-8
    set -gx EDITOR="nvim"
    set -gx TERMINAL='kitty"
    set -gx BROWSER="brave-nightly"
    set fish_greeting 

    
    


# Path to your Starship custom
    #Path
    set -gx PATH=~/.local/bin:$PATH

    #Starship
    starship init fish | source
    set -gx STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

    #Npm
    set -gx PATH=~/.npm-global/bin:$PATH

#Alias
    # git
    alias g='git'
    alias ga='git add'
    alias gc='git clone'
    alias gcm='git commit -m'
    alias gh='git push'
    alias gl='git pull'
    alias lg='lazygit'

    # ls
    alias "ls -a"='logo-ls -A'
    alias ls='logo-ls'
    alias ll='logo-ls -l'
    alias la='logo-ls -A'
    alias "ls -l"="logo-ls -l"

    #clear
    alias cl='clear'


    # Vim
    alias v='nvim'
    alias vi='nvim'
    alias vim='nvim'
    alias nv='nvim'

    # lunarvim
    alias lv='~/.local/bin/lua'

    # python3 as default
    alias python='python3'

    # docker
    alias dk='docker'
    alias dc='docker-compose'

    # ranger
    alias rr='ranger'

# Active
    # Neofetch
    neofetch --source ~/.dotfiles/image/pixiv/manox_x.jpg | lolcat

    # betterlockscreen
    betterlockscreen -u ~/.dotfiles/image/pixiv/mano2.jpg 

  

