#
# ~/.bashrc
#
complete -cf sudo

stty -ixon
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s autocd

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

case "$TERM" in
    xterm)
        export TERM=xterm-256color
        ;;
    screen)
        export TERM=screen-256color
        ;;
esac

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF

alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  && 
sudo pacman -Suu'

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias vi='vim'
alias r="ranger"
alias mutt="mutt -F ~/.config/scripts/mutt/muttrc"
alias mocp="mocp --config ~/.config/scripts/moc/config"
alias calcurse="calcurse -D ~/.config/scripts/calcurse"
alias weechat="weechat -d ~/.config/scripts/weechat"
alias tmux="tmux -f ~/.config/i3/scripts/tmux.conf"

#Term only
alias mute="pamixer -m"
alias vd="pamixer -d 10"
alias vu="pamixer -i 10"
alias p="mocp -G &> /dev/null"
alias next="mocp -f &> /dev/null"
alias prev="mocp -r &> /dev/null"
alias mnt="sudo bash ~/.config/i3/scripts/mount.sh"
alias umnt="sudo bash ~/.config/i3/scripts/unmount.sh"
alias sdn="sudo shutdown now"

alias screenfetch="screenfetch -t"
alias yt="youtube-dl -ic"
alias yta="youtube-dl -xic"

alias newnet="sudo systemctl restart NetworkManager"

alias youtube="youtube-viewer"
alias YT="youtube-viewer"
alias syt="youtube-viewer"

alias TC='find . -maxdepth 1 -regextype gnu-awk -regex "^.*\.(pyc|pyo|bak|swp|aux|log|nav|out|snm|toc|bcf|run\.xml|synctex\.gz|blg|bbl)" -delete'

alias ethspeed="speedometer -r enp0s25"

note() { echo "$@" >> ~/notes ;}

alias extract="~/.config/i3/script/extract.sh"

backup() { cp $1 $1.bu ;}

alias mailsync="bash ~/.config/i3/scripts/mailsyncloop.sh"

alias wifispeed="speedometer -r wlp2s0"


ESC=$'['
END_ESC=m

NOPRINT='\['
END_NOPRINT='\]'

WRAP="$NOPRINT$ESC"
END_WRAP="$END_ESC$END_NOPRINT"

RESET="${WRAP}0${END_WRAP}"
RESET_BG="${WRAP}49${END_WRAP}"

NORMAL="${WRAP}21${END_WRAP}"
BOLD="${WRAP}1${END_WRAP}"

function __fg_color {
    printf "%s" "${WRAP}38;5;${1}${END_WRAP}"
}

function __bg_color {
    printf "%s" "${WRAP}48;5;${1}${END_WRAP}"
}

BLACK=$(__fg_color 0)
RED=$(__fg_color 1)
GREEN=$(__fg_color 2)
YELLOW=$(__fg_color 3)
BLUE=$(__fg_color 4)
PURPLE=$(__fg_color 5)
CYAN=$(__fg_color 6)
WHITE=$(__fg_color 7)

ALT_BLACK=$(__fg_color 8)
ALT_RED=$(__fg_color 9)
ALT_GREEN=$(__fg_color 10)
ALT_YELLOW=$(__fg_color 11)
ALT_BLUE=$(__fg_color 12)
ALT_PURPLE=$(__fg_color 13)
ALT_CYAN=$(__fg_color 14)
ALT_WHITE=$(__fg_color 15)

BLACK_BG=$(__bg_color 0)
RED_BG=$(__bg_color 1)
GREEN_BG=$(__bg_color 2)
YELLOW_BG=$(__bg_color 3)
BLUE_BG=$(__bg_color 4)
PURPLE_BG=$(__bg_color 5)
CYAN_BG=$(__bg_color 6)
WHITE_BG=$(__bg_color 7)

ALT_BLACK_BG=$(__bg_color 8)
ALT_RED_BG=$(__bg_color 9)
ALT_GREEN_BG=$(__bg_color 10)
ALT_YELLOW_BG=$(__bg_color 11)
ALT_BLUE_BG=$(__bg_color 12)
ALT_PURPLE_BG=$(__bg_color 13)
ALT_CYAN_BG=$(__bg_color 14)
ALT_WHITE_BG=$(__bg_color 15)

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

if [ -d ~/.bash.d ]; then
    for i in ~/.bash.d/*; do
        [ -f "${i}" ] && source "${i}"
    done
fi

[[ -f ~/dotfiles/.localrc ]] && . ~/dotfiles/.localrc
