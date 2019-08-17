####################################################################
# Install bat - A 'cat' clone with wings
####################################################################
CMD="bat"
CMDTITLE="A 'cat' clone with wings"

if (( ! $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"
  LATEST_BAT_VERSION=$( curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep '"tag_name":' | cut -d '"' -f 4 | sed 's/v//' )

  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      BAT_FILE_NAME=bat_$LATEST_BAT_VERSION'_'$ARCH2'.deb'
      wget https://github.com/sharkdp/bat/releases/download/v$LATEST_BAT_VERSION/$BAT_FILE_NAME >/dev/null 2>&1 ; \
      sudo dpkg -i $BAT_FILE_NAME >/dev/null 2>&1 ; \
      rm -f $BAT_FILE_NAME >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;
    *)
      echo "No install procedure for $CMD for your OS/distro available, please install manually."
      ;;
  esac
fi

# Load if command exists
if (( $+commands[$CMD] )); then

else

fi
