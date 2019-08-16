####################################################################
# Install bat - A cat(1) clone with wings
####################################################################
if ! type "bat" > /dev/null; then
  echo "Installing bat - a 'cat' clone on wings"
  LATEST_BAT_VERSION=$( curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep '"tag_name":' | cut -d '"' -f 4 | sed 's/v//' )

  # OS specific installation steps
  case "$DISTRO" in
    debian|ubuntu|elementary|mint)
    BAT_FILE_NAME=bat_$LATEST_BAT_VERSION'_amd64.deb'
    wget https://github.com/sharkdp/bat/releases/download/v$LATEST_BAT_VERSION/$BAT_FILE_NAME >/dev/null 2>&1
    sudo dpkg -i $BAT_FILE_NAME >/dev/null 2>&1
    rm -f $BAT_FILE_NAME >/dev/null 2>&1
    echo " OK"
    ;;
    *)
    echo "No install procedure for your OS available."
    ;;
  esac
fi
