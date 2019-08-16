if [[ -d $HOME/.fonts ]]; then
  source ~/.fonts/*.sh
  fc-cache -f
fi
