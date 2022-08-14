

set fish_greeting

# Alias
		# Neovim
		alias nv='nvim'
		alias v='nvim'
		alias nvi='nvim'
		#alias vim='nvim'
			 #clear Swap nvim 
			 alias clnv='rm -rf /home/$(whoami)/.local/share/nvim/swap'

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

		#docker
		alias docker-d="systemctl --user start docker-desktop"
		alias docker-ds="systemctl --user stop docker-desktop"



# Active
		#neofetch
		neofetch --source ~/Pictures/image/pixiv/mano4.jpg | lolcat

		#starship
		set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml

		starship init fish | source



# TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467C
    set -l comment 565f89
    set -l red fa4848
    set -l orange ffa04d
    set -l yellow fff645
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 5afafa
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $purple
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $yellow
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
#neofetch
