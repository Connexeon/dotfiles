####################################################################
# Install thefuck - Magnificent app which corrects your previous console command
####################################################################
if !(( $+commands[fuck] )); then
  echo "Installing thefuck - Magnificent app which corrects your previous console command"

  # OS specific installation steps
  case "$DISTRO" in
    debian|ubuntu|elementary|mint)
    sudo apt install -y python3-dev python3-pip python3-setuptools >/dev/null 2>&1
    sudo -H pip3 install thefuck >/dev/null 2>&1
    echo " OK"
    ;;
    *)
    echo "No install procedure for your OS available."
    ;;
  esac
fi
