# neofetch --ascii ~/.config/neofetch/arch

if [ "$XDG_SESSION_TYPE" != "tty" ]
  if [ "$TERM" != "xterm-256color" ]
    neofetch --source ~/.config/hypr/wallpaper.png
  else
    neofetch --ascii ~/.config/neofetch/hydra
  end
else
    neofetch --ascii ~/.config/neofetch/arch
end


starship init fish | source
