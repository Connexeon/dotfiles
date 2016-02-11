source  ~/.dotfiles/antigen/antigen.zsh

# change the size of history files
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTTIMEFORMAT="[%d.%m.%y] %T   "

export TERM="xterm-256color"

#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin"
alias postfixlog='pflogsumm -d today --verbose_msg_detail /var/log/maillog'
alias top2="glances"
alias cmdir='pushd /usr/local/src/centminmod'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo declared above.
antigen bundles <<EOBUNDLES
git
pip
command-not-found
autojump
common-aliases
compleat
git-extras
git-flow
history
web-search
n98-magerun
z
yum
#sysadmin
cp
djui/alias-tips
voronkovich/mysql.plugin.zsh
oldratlee/hacker-quotes

zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search

mafredri/zsh-async

EOBUNDLES

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle gem
    antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
    # None so far...
    if [[ $DISTRO == 'CentOS' ]]; then
        antigen bundle centos
    fi
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
    antigen bundle cygwin
fi

# Load the theme.
#antigen theme bhilburn/powerlevel9k powerlevel9k
#antigen bundle sindresorhus/pure
#antigen theme halfo/lambda-mod-zsh-theme lambda-mod
#antigen theme sindresorhus/pure pure
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

# keybindings Linux ssh home/end/...
bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
