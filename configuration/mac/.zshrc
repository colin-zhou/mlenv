# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/colin/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="spaceship"

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

plugins=(git autojump osx brew node npm zsh-syntax-highlighting python pip virtualenv jira colorize)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# texlive bin and man path
if [ -d "/usr/local/texlive/2016/bin/x86_64-darwin" ];then
    export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/texlive/2016/bin/x86_64-darwin"
    export MANPATH="/usr/local/man:$MANPATH"
fi

if [ -d "/Users/colin/Git/arcanist/bin" ];then
    export PATH=$PATH:/Users/colin/Git/arcanist/bin
fi

if [ -d "/usr/local/bin" ];then
    export PATH=$PATH:/usr/local/bin
fi

if [ -d "/usr/local/sbin" ];then
    export PATH=$PATH:/usr/local/sbin
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias docker_restart="osascript -e 'quit app \"Docker\"' && open -a Docker"
if [ -d "/Users/colin/Workspace/jupyter_dir" ]; then
    alias pynb="nohup jupyter notebook --notebook-dir=~/Workspace/jupyter_dir > /dev/null 2>&1 &"
else
    alias pynb="nohup jupyter notebook --notebook-dir=~/Workspace > /dev/null 2>&1 &"
fi
# if alias
if [ -f ~/q/m32/q ];then
    alias q='QUHOME=~/q rlwrap -r ~/q/m32/q'
fi
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Owner
export USER_NAME="ZHOU CHAOLIN"

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'
alias vim="mvim -v"
alias kvpn='sudo vpnc-disconnect'
alias ctags="`brew --prefix`/bin/ctags"
alias g='grep --color=always -EnR'
alias svpn='sudo vpnc-connect'
alias adbphone='adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh'
alias subl='subl --add'
alias mycmt='git log --author="Zhou Chaolin" --no-merges | grep -e "commit [a-zA-Z0-9]*" | wc -l'

# Docker
entrydocker() {
    docker exec -it $1 /bin/bash
}
matchdocker() {
    docker ps | grep $1
}

source "/Users/colin/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/Cellar/python/3.6.5/bin/:$PATH"


source "/Users/colin/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

# the configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# vpn
vpn-connect() {
    osascript -e '
    tell application "System Events"
            tell current location of network preferences
                    set VPN to service "VPN (L2TP)" -- your VPN name here
                    if exists VPN then connect VPN
                    repeat while (current configuration of VPN is not connected)
                        delay 1
                    end repeat
            end tell
    end tell'
}

vpn-disconnect() {
    osascript -e '
    tell application "System Events"
            tell current location of network preferences
                    set VPN to service "VPN (L2TP)" -- your VPN name here
                    if exists VPN then disconnect VPN
            end tell
    end tell'
}
export PATH="/usr/local/opt/gettext/bin:$PATH"
