if [[ -d $HOME/.fonts ]]; then
  # Load all .sh files in $HOME/.fonts
  . $HOME/.fonts/*.sh

  # Reload font cache
  fc-cache -f
fi
