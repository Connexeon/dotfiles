####################################################################
# PATH stuff
####################################################################

## Include these dirs in $PATH if they exist
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.dotfiles/bin" ]; then
  export PATH="$HOME/.dotfiles/bin:$PATH"
fi
