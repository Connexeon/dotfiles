source  ~/.dotfiles/antigen/antigen.zsh

## EXPORT
# change the size of history files
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTTIMEFORMAT="[%d.%m.%y] %T   "
export TERM=xterm-256color
export CLICOLOR=1
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin"

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export PAGER='most'
export EDITOR='vim'

## ALIAS
alias top2="glances"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'

# Centminmod
alias cmdir='pushd /usr/local/src/centminmod'
alias postfixlog='pflogsumm -d today --verbose_msg_detail /var/log/maillog'

# git
alias update-submodules="git submodule foreach 'git checkout master && git pull origin master'"

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

antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like suggestions bundle
antigen bundle tarruda/zsh-autosuggestions

# Right arrow to the entire suggestion
AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
#antigen theme bhilburn/powerlevel9k powerlevel9k
#antigen theme halfo/lambda-mod-zsh-theme lambda-mod
#antigen theme sindresorhus/pure pure
antigen bundle sindresorhus/pure

# Tell antigen that you're done.
antigen apply

# KEYBINDING

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive
bindkey '^T' autosuggest-toggle

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

bindkey '^R' zaw-history

# Source a local zshrc if it exists.
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
