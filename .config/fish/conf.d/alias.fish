alias nv='nvim'
alias v='nvim'
alias nvi='nvim'

#clear Swap nvim 
alias clnv='rm -rf /home/$(whoami)/.local/share/nvim/swap'

# logo-list
alias ls="ls -a --color=auto"
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'

# git
alias ga="git add"
alias gl="git pull"
alias gh="git push"
alias gb="git branch"
alias gc="git commit"


if [ "$XDG_SESSION_TYPE" != "tty" ]
  if [ "$TERM" != "xterm-256color" ]
   alias neofetch="neofetch --source ~/.config/wallpaper/wallpaper.png"
  else
   alias neofetch="neofetch --ascii ~/.config/neofetch/hydra"
  end
else
   alias neofetch="neofetch --ascii ~/.config/neofetch/arch"
end
