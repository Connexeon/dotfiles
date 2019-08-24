####################################################################
# Install fd - A simple, fast and user-friendly alternative to 'find'
####################################################################
CMD="fdfind"
CMDTITLE="A simple, fast and user-friendly alternative to 'find'"

if (( ! $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"

  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      sudo apt-get -y install fd-find >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      echo "No install procedure for $CMD for your OS/distro available, please install manually."
      ;;
  esac
fi


# Load if command exists
if (( $+commands[$CMD] )); then
  alias fd=fdfind

fi
