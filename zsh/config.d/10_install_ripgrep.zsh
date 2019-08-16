####################################################################
# Install ripgrep - A fast command-line search tool
####################################################################
CMD=ripgrep
CMDTITLE="A fast command-line search tool"

if !(( $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"

  # OS specific installation steps
  case "$DISTRO" in
    debian|ubuntu|elementary|mint)
      sudo apt -y install ripgrep > /dev/null 2>&1
      echo " OK"
      ;;
    *)
      echo "No install procedure for $CMD for your OS/distro available, please install manually."
      ;;
  esac
fi


# Load if command exists
if (( $+commands[$CMD] )); then

fi
