# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# ZSH_THEME="robbyrussell"
# ZSH_THEME="kolo"
# ZSH_THEME="apple"
# ZSH_THEME="half-life"
ZSH_THEME="jnrowe"
# ZSH_THEME="flazz"
# ZSH_THEME="nicoulaj"
# ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump osx mvn zsh-completions zsh-syntax-highlighting)

# User configuration

export PATH=/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
export EDITOR=vim
export HISTFILESIZE=42195

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias vi='vim'
alias git-cleanup="git branch --merged | grep -v \"\\*\" | xargs -n 1 git branch -d"

alias -s py=vim
alias -s js=vim
alias -s c=vim
alias -s txt=vim

export PATH=/usr/local/bin:$PATH
alias qrcode='f() { printf $1 | curl -F-=\<- qrenco.de };f'
alias getip='curl curlmyip.net'

function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi

function pattach() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi

    sessions=$(tmux ls)
    [ $? -ne 0 ] && return

    session=$(echo $sessions | eval $PERCOL | cut -d : -f 1)
    if [[ -n "$session" ]]; then
        tmux att -t $session
    fi
}

#alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"


mac_config() {
    alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
    export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    function setproxy() {
        export http_proxy=http://127.0.0.1:1080
        export https_proxy=http://127.0.0.1:1080
    }

    function noproxy() {
        unset http_proxy
        unset https_proxy
    }

    function apmproxy() {
        apm config set proxy http://127.0.0.1:1080
        apm config set https-proxy http://127.0.0.1:1080
    }
}

arch_config() {
    #alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  && sudo pacman -Suu'
    alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman -Syyuu  && sudo pacman -Suu'
    alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
    alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
    alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
    alias grep='grep --color=tty -d skip'
    alias r="ranger"
    alias mutt="mutt -F ~/.config/scripts/mutt/muttrc"
    alias mocp="mocp --config ~/.config/scripts/moc/config"
    alias calcurse="calcurse -D ~/.config/scripts/calcurse"
    alias weechat="weechat -d ~/.config/scripts/weechat"
    alias tmux="tmux -f ~/.config/scripts/tmux.conf"

    #Term only
    alias mute="pamixer -m"
    alias vd="pamixer -d 10"
    alias vu="pamixer -i 10"
    alias p="mocp -G &> /dev/null"
    alias next="mocp -f &> /dev/null"
    alias prev="mocp -r &> /dev/null"
    alias mnt="sudo bash ~/.config/scripts/mount.sh"
    alias umnt="sudo bash ~/.config/scripts/unmount.sh"
    alias sdn="sudo shutdown now"

    alias screenfetch="screenfetch -t"
    alias yt="youtube-dl -ic"
    alias yta="youtube-dl -xic"

    alias newnet="sudo systemctl restart NetworkManager"

    alias youtube="youtube-viewer"

    alias TC='find . -maxdepth 1 -regextype gnu-awk -regex "^.*\.(pyc|pyo|bak|swp|aux|log|nav|out|snm|toc|bcf|run\.xml|synctex\.gz|blg|bbl)" -delete'

    alias ethspeed="speedometer -r enp0s25"

    note() { echo "$@" >> ~/notes ;}

    alias extract="~/.config/script/extract.sh"

    backup() { cp $1 $1.bu ;}

    alias mailsync="bash ~/.config/scripts/mailsyncloop.sh"

    alias wifispeed="speedometer -r wlp2s0"
}

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

source ~/dotfiles/.localrc
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="/usr/local/sbin:$PATH"
