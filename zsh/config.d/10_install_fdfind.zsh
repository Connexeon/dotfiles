####################################################################
# Install fd - A simple, fast and user-friendly alternative to 'find'
####################################################################
CMD=fdfind
CMDTITLE="A simple, fast and user-friendly alternative to 'find'"

if !(( $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"  echo "Installing fd"

  # OS specific installation steps
  case "$DISTRO" in
    debian|ubuntu|elementary|mint)
      sudo apt-get -y install fd-find >/dev/null 2>&1
      echo " OK"
      ;;
    *)
      echo "No install procedure for your OS available."
      ;;
  esac
fi
alias fd=fdfind

# Load if command exists
if (( $+commands[$CMD] )); then

else

fi
