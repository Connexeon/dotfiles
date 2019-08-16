####################################################################
# Install fzf - a general-purpose command-line fuzzy finder
####################################################################
if ! (( $+commands[fzf] )); then
  echo "Installing fzf - a general-purpose command-line fuzzy finder"
  ~/.fzf/install --no-key-bindings --no-completion --no-update-rc 2>&1
fi
