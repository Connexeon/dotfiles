####################################################################
# KEYBINDING
####################################################################

# Use CTRL+R to search history, CTRL-E to accept selected line from search without entering command yet
#bindkey '^R' zaw-history
# zstyle ':filter-select' max-lines 3
# zstyle ':filter-select:highlight' matched fg=green,standout
# zstyle ':filter-select' case-insensitive yes # enable case-insensitive
# zstyle ':filter-select' extended-search yes # see below
# zstyle ':filter-select' rotate-list yes # enable rotation for filter-select
# zstyle ':filter-select' hist-find-no-dups yes # ignore duplicates in history source
# zstyle ':filter-select' escape-descriptions no # display literal newlines, not \n, etc

bindkey -M filterselect '^R' down-line-or-history
bindkey -M filterselect '^S' up-line-or-history
bindkey -M filterselect '^E' accept-search

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
bindkey '\e[1~' beginning-of-line  # Linux console
bindkey '\e[H'  beginning-of-line  # xterm
bindkey '\eOH'  beginning-of-line  # gnome-terminal
bindkey '\e[2~' overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~' delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~' end-of-line        # Linux console
bindkey '\e[F'  end-of-line        # xterm
bindkey '\eOF'  end-of-line        # gnome-terminal

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
