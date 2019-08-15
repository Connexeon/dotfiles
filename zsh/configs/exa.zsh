####################################################################
# Install exa - A modern version of ‘ls’
####################################################################
if ! type "exa" > /dev/null; then
  echo "Installing exa - a modern version of 'ls'"

  # OS specific installation steps
  if [[ $DISTRO == 'darwin' ]]; then

  elif [[ $DISTRO == 'centos' || $DISTRO == 'centminmod' ]]; then

  elif [[ $DISTRO == 'ubuntu' || $DISTRO == 'elementary' || "${DISTRO#*debian}" != "$DISTRO" ]]; then
    sudo apt-get -y install exa librust-exa+git\*-dev >/dev/null 2>&1
    echo " OK"
  elif [[ $DISTRO == 'cygwin' ]]; then

  else

  fi
fi
