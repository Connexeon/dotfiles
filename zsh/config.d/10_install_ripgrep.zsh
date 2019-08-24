####################################################################
# Install ripgrep - A fast command-line search tool
####################################################################
CMD="rg"
CMDTITLE="ripgrep, a fast command-line search tool"

if (( ! $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"

  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      sudo apt -y install ripgrep > /dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      echo "No install procedure for $CMD for your OS/distro available, please install manually."
      ;;
  esac
fi

# Load if command exists
if (( $+commands[$CMD] )); then

fi
