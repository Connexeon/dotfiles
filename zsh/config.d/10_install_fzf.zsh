####################################################################
# Install fzf - a general-purpose command-line fuzzy finder
####################################################################
if !(( $+commands[fzf] )); then
  echo "Installing fzf - a general-purpose command-line fuzzy finder"
  $HOME/.fzf/install --no-key-bindings --no-completion --no-update-rc # >/dev/null 2>&1
fi
