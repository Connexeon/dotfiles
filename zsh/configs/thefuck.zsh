####################################################################
# Install thefuck - A modern version of ‘ls’
####################################################################
if ! type "fuck" > /dev/null; then
  echo "Installing thefuck"

  # OS specific installation steps
  if [[ $DISTRO == 'darwin' ]]; then

  elif [[ $DISTRO == 'centos' || $DISTRO == 'centminmod' ]]; then

  elif [[ $DISTRO == 'ubuntu' || $DISTRO == 'elementary' || "${DISTRO#*debian}" != "$DISTRO" ]]; then
    sudo apt install -y python3-dev python3-pip python3-setuptools >/dev/null 2>&1
    sudo -H pip3 install thefuck >/dev/null 2>&1
    echo " OK"
  elif [[ $DISTRO == 'cygwin' ]]; then

  else

  fi
else

fi
