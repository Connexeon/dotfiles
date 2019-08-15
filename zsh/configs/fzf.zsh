####################################################################
# Install fzf - a general-purpose command-line fuzzy finder
####################################################################
if ! type "fzf" > /dev/null; then
  echo "Installing fzf - a general-purpose command-line fuzzy finder"
  ~/.fzf/install 2>&1
fi
