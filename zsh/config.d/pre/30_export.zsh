####################################################################
## EXPORT
####################################################################

export TERM="xterm-256color"
export CLICOLOR=1

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'

export ZSH_ALIAS_FINDER_AUTOMATIC=true

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='gedit'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=2
