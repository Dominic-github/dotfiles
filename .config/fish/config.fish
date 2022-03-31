

set fish_greeting

# Alias
		# Neovim
		alias nv='nvim'
		alias v='nvim'
		alias nvi='nvim'
		alias vim='nvim'

		# logo-list
		alias ls="logo-ls"
		alias la='logo-ls -a'
		alias ll='logo-ls -l'

		# git
		alias ga="git add"
		alias gl="git pull"
		alias gh="git push"
		alias gb="git branch"
		alias gc="git commit"


# Active
		#neofetch
		neofetch --source ~/Pictures/image/pixiv/mano4.jpg | lolcat

		#starship
		starship init fish | source

		#ibus
	#	set -x GTK_IM_MODULE ibus
	#	set -x XMODIFIERS @im=ibus
	#	set -x QT_IM_MODULE ibus
	#	pidof ibus-daemon > /dev/null || ibus-daemon -drx
