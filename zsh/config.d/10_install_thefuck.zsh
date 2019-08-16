####################################################################
# Install thefuck - Magnificent app which corrects your previous console command
####################################################################
CMD=thefuck
CMDTITLE="Magnificent app which corrects your previous console command"

if !(( $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"

  # OS specific installation steps
  case "$DISTRO" in
    debian|ubuntu|elementary|mint)
      sudo apt install -y python3-dev python3-pip python3-setuptools >/dev/null 2>&1
      sudo -H pip3 install thefuck >/dev/null 2>&1
      echo " OK"
      ;;
    *)
      echo "No install procedure for $CMD for your OS/distro available, please install manually."
      ;;
  esac
fi

# Load if command exists
if (( $+commands[$CMD] )); then
  eval $(thefuck --alias)
fi
