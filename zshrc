####################################################################
# Load Antigen
####################################################################
#set -xe

#POWERLEVEL9K_STATUS_VERBOSE="true"
POWERLEVEL9K_MODE='awesome-fontconfig'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Disable dir/git icons
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

DISABLE_AUTO_TITLE="true"

POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs virtualenv rbenv rvm time)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

POWERLEVEL9K_VPN_IP_INTERFACE="zt0"

POWERLEVEL9K_STATUS_VERBOSE=false
export DEFAULT_USER="$USER"

source ~/.antigen/antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

if [ -z ${ZSH_CACHE_DIR} ]; then
  ZSH_CACHE_DIR="${HOME}/.cache"
fi

# Set PATH so it includes user's private python-pip bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

emulate sh -c 'source /etc/profile'

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

####################################################################
# Get System Info
####################################################################

# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" = "linux" ]; then
  # If available, use LSB to identify distribution
  if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
    export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | tr "[:upper:]" "[:lower:]")
    # Otherwise, use release de file
  else
    export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1 | tr "[:upper:]" "[:lower:]")
  fi
fi

# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" = "" ] && export DISTRO=$UNAME
unset UNAME

####################################################################
## EXPORT
####################################################################

setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY

# change the size of history files
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export SAVEHIST=$HISTSIZE;
export HISTTIMEFORMAT="[%d.%m.%y] %T   "
export TERM="xterm-256color"
export CLICOLOR=1
export PATH=$PATH:$HOME/bin

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='nano'

export NNN_OPENER=xdg-open
export NNN_OPENER="gio open"
export NNN_OPENER=gvfs-open

export NNN_USE_EDITOR=1
export NNN_DE_FILE_MANAGER=nautilus
export NNN_BMS='doc:~/Documents;D:~/Downloads/'

####################################################################
## ALIAS
####################################################################

alias updot="cd ~/.dotfiles && git remote set-url origin https://github.com/Connexeon/dotfiles.git && git pull origin master && ./install && source ~/.zshrc"
alias sudo="sudo "

alias top2="glances"
alias nn="nano"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls="ls -GFh"

# Same as above, but in long listing format
alias ll="ls -GFhl"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Centminmod
alias cmdir='pushd /usr/local/src/centminmod'
alias postfixlog='pflogsumm -d today --verbose_msg_detail /var/log/maillog'

# git
alias update-submodules="git submodule foreach 'git checkout master && git pull origin master'"

# chmod
alias rw-='chmod 600'
alias rwx='chmod 700'
alias r--='chmod 644'
alias r-x='chmod 755'

# grep
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# neofetch
alias neofetch2="neofetch \
  --config off \
  --block_range 1 8 \
  --bold off \
  --uptime_shorthand on \
  --gtk_shorthand on \
  --colors 4 1 8 8 8 7 \
  "

# Public key to clipboard
alias pubkey="xclip -sel clip < ~/.ssh/id_rsa.pub"

# nnn terminal explorer must-have
alias n='nnn -d'

####################################################################
## FUNCTIONS
####################################################################

function console {
  if [[ $# > 0 ]]; then
    query=$(echo "$*" | tr -s ' ' '|')
    tail -f /var/log/messages|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/messages
  fi
}

function dig-serials () {
  dig $1 +nssearch | cut -d' ' -f4,11
}

####################################################################
## BUNDLES
####################################################################
# Bundles from the default repo declared above.
#
##    trapd00r/zsh-syntax-highlighting-filetypes

antigen bundles <<EOBUNDLES
    chrissicool/zsh-256color
    zsh-users/zsh-completions
    Tarrasch/zsh-autoenv
    git
    pip
    npm
    vagrant
    compleat
    git-extras
    git-flow
    web-search
    n98-magerun
    voronkovich/mysql.plugin.zsh
    DimitriSteyaert/Zsh-tugboat
    mafredri/zsh-async
    unixorn/autoupdate-antigen.zshplugin
    laravel
    laravel5
    symfony2
    history
    djui/alias-tips
    z
    supercrabtree/k
    yum
    systemd
    systemadmin
    skx/sysadmin-util
    rsync
    cp
    command-not-found
    autojump
    dirhistory
    colorize
    common-aliases
    redis-cli
    docker
    extract
    zsh-navigation-tools
    lukechilds/zsh-better-npm-completion
    srijanshetty/zsh-pip-completion
    greymd/docker-zsh-completion
    EslamElHusseiny/aws_manager_plugin
    bobthecow/git-flow-completion
    bobsoppe/zsh-ssh-agent
    soimort/translate-shell
EOBUNDLES

# OS specific plugins
if [[ $DISTRO == 'darwin' ]]; then
  antigen bundle brew
  antigen bundle brew-cask
  antigen bundle gem
  antigen bundle osx
elif [[ $DISTRO == 'centos' || $DISTRO == 'centminmod' ]]; then
  antigen bundle centos
elif [[ $DISTRO == 'ubuntu' ]]; then
  antigen bundle ubuntu
elif [[ $DISTRO == 'debian' ]]; then
  antigen bundle ubuntu
elif [[ $DISTRO == 'cygwin' ]]; then
  antigen bundle cygwin
fi

# antigen bundle willghatch/zsh-cdr
antigen bundle zsh-users/zaw
antigen bundle termoshtt/zaw-systemd

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
#ZSH_AUTOSUGGEST_USE_ASYNC=true

####################################################################
# KEYBINDING
####################################################################

# Use CTRL+R to search history, CTRL-E to accept selected line from search without entering command yet
bindkey '^R' zaw-history
zstyle ':filter-select' max-lines 3
zstyle ':filter-select:highlight' matched fg=green,standout
zstyle ':filter-select' case-insensitive yes # enable case-insensitive
zstyle ':filter-select' extended-search yes # see below
zstyle ':filter-select' rotate-list yes # enable rotation for filter-select
zstyle ':filter-select' hist-find-no-dups yes # ignore duplicates in history source
zstyle ':filter-select' escape-descriptions no # display literal newlines, not \n, etc

#bindkey -M filterselect '^R' down-line-or-history
#bindkey -M filterselect '^S' up-line-or-history
#bindkey -M filterselect '^E' accept-search
#
# extended-search:
#     If this style set to be true value, the searching bahavior will be
#     extended as follows:
#
#     ^ Match the beginning of the line if the word begins with ^
#     $ Match the end of the line if the word ends with $
#     ! Match anything except the word following it if the word begins with !
#     so-called smartcase searching
#
#     If you want to search these metacharacters, please doubly escape them.


# Use CTRL+X to select from other sources than history first (screen sessions, executables, ...)
bindkey '^X' zaw
# Use CTRl+T to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive
bindkey '^T' autosuggest-toggle
bindkey '^ ' autosuggest-accept

# Keybindings home/end/...
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

# Bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


####################################################################
# Bundle pre-load requirements
####################################################################

export NNN_COMPLETION=~"/Projects/Life/nnn/scripts/auto-completion/zsh"
if [ -f $NNN_COMPLETION ]; then

fpath=(
  $fpath
)

####################################################################
# Load theme & apply Antigen
####################################################################
# Load theme
antigen theme bhilburn/powerlevel9k powerlevel9k
# Tell antigen that you're done.
antigen apply

####################################################################
# Show system info & some ASCII art
####################################################################
if ! type "neofetch" > /dev/null; then
  # OS specific installation steps
  if [[ $DISTRO == 'darwin' ]]; then
  elif [[ $DISTRO == 'centos' || $DISTRO == 'centminmod' ]]; then
    sudo yum install epel-release -y
    sudo curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
    sudo yum install neofetch -y
  elif [[ $DISTRO == 'ubuntu' ]]; then
    sudo apt-get install neofetch
  elif [[ $DISTRO == 'cygwin' ]]; then
  else
    sudo apt-get install neofetch
  fi
else
  neofetch
fi

####################################################################
# Install nnn
####################################################################
if ! type "nnn" > /dev/null; then
  # OS specific installation steps
  if [[ $DISTRO == 'darwin' ]]; then
  elif [[ $DISTRO == 'centos' || $DISTRO == 'centminmod' ]]; then
    sudo yum install epel-release -y
    sudo curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
    sudo yum install nnn -y
  elif [[ $DISTRO == 'ubuntu' ]]; then
    sudo add-apt-repository ppa:twodopeshaggy/jarun
    sudo apt-get update && sudo apt-get install nnn
  elif [[ $DISTRO == 'cygwin' ]]; then
  else
    sudo apt-get update && sudo apt-get install nnn
  fi
fi

####################################################################
# Local zshrc
####################################################################

# Source a local zshrc if it exists.
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

####################################################################
# Use modern completion system
####################################################################

export ANTIGEN_COMPDUMP=~/.antigen/.zcompdump

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
#eval $( dircolors -b $HOME/LS_COLORS )
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

####################################################################
# Various
####################################################################
