####################################################################
# Load Antigen
####################################################################

source ~/.antigen/antigen.zsh

if [ -z ${ZSH_CACHE_DIR} ]; then
  ZSH_CACHE_DIR="${HOME}/.cache"
fi

####################################################################
# Get System Info
####################################################################

# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" = "linux" ]; then
  # If available, use LSB to identify distribution
  if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
    export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
  else
    export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
  fi
fi
# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" = "" ] && export DISTRO=$UNAME
unset UNAME

####################################################################
## EXPORT
####################################################################

setopt HIST_IGNORE_DUPS
# change the size of history files
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTTIMEFORMAT="[%d.%m.%y] %T   "
export TERM=xterm-256color
export CLICOLOR=1
export PATH=$PATH:$HOME/bin

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='nano'

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

####################################################################
## BUNDLES
####################################################################

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo declared above.
antigen bundles <<EOBUNDLES
    zsh-users/zsh-completions
    desyncr/auto-ls
    Tarrasch/zsh-autoenv
    git
    pip
    compleat
    git-extras
    git-flow
    web-search
    n98-magerun
    voronkovich/mysql.plugin.zsh
    tugboat
    mafredri/zsh-async
    unixorn/autoupdate-antigen.zshplugin
    laravel
    laravel5
    symfony2
    systemd
    history
    djui/alias-tips
    z
    yum
    systemadmin
    rsync
    cp
    command-not-found
    autojump-zsh
    colorize
    common-aliases
    redis-cli
    docker
    supercrabtree/k
    extract
    zsh-navigation-tools
    MichaelAquilina/zsh-autoswitch-virtualenv
    lukechilds/zsh-better-npm-completion
    srijanshetty/zsh-pip-completion
    greymd/docker-zsh-completion
    EslamElHusseiny/aws_manager_plugin
    bobthecow/git-flow-completion
    bobsoppe/zsh-ssh-agent
EOBUNDLES

# OS specific plugins
if [[ $DISTRO == 'Darwin' ]]; then
  antigen bundle brew
  antigen bundle brew-cask
  antigen bundle gem
  antigen bundle osx
elif [[ $DISTRO == 'centos' ]]; then
  antigen bundle centos
elif [[ $DISTRO == 'Ubuntu' ]]; then
  antigen bundle ubuntu
elif [[ $DISTRO == 'Cygwin' ]]; then
  antigen bundle cygwin
fi

# Fish-like suggestions bundle
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle tarruda/zsh-autosuggestions

antigen bundle zsh-users/zaw
antigen bundle termoshtt/zaw-systemd

# Load the theme.
#antigen theme bhilburn/powerlevel9k powerlevel9k
#antigen theme halfo/lambda-mod-zsh-theme lambda-mod
#antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)

####################################################################
# KEYBINDING
####################################################################

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

# Use CTRl+T to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive
bindkey '^T' autosuggest-toggle

# Use CTRL+R to search history, CTRL-E to accept selected line from search without entering command yet
bindkey '^R' zaw-history
bindkey -M filterselect '^R' down-line-or-history
bindkey -M filterselect '^S' up-line-or-history
bindkey -M filterselect '^E' accept-search

zstyle ':filter-select' rotate-list yes # enable rotation for filter-select
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search
zstyle ':filter-select' extended-search yes # see below
zstyle ':filter-select' hist-find-no-dups yes # ignore duplicates in history source
zstyle ':filter-select' escape-descriptions no # display literal newlines, not \n, etc

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

####################################################################
# Show system info & some ASCII art
####################################################################
if ! type "neofetch" > /dev/null; then
  # OS specific installation steps
  if [[ $DISTRO == 'Darwin' ]]; then
  elif [[ $DISTRO == 'centos' ]]; then
    sudo yum install epel-release -y
    sudo curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
    sudo yum install neofetch -y
  elif [[ $DISTRO == 'Ubuntu' ]]; then
    sudo apt-get install neofetch
  elif [[ $DISTRO == 'Cygwin' ]]; then
  else
    sudo apt-get install neofetch
  fi
fi
neofetch

####################################################################
# Local zshrc
####################################################################

# Source a local zshrc if it exists.
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi


####################################################################
# Additional
####################################################################

# The following lines were added by compinstall

zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle :compinstall filename '/root/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
