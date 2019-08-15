####################################################################
# Install nnn
####################################################################
if ! type "nnn" > /dev/null; then
  # OS specific installation steps
  if [[ $DISTRO == 'darwin' ]]; then
  elif [[ $DISTRO == 'centos' || $DISTRO == 'centminmod' ]]; then
    sudo rpm -i https://github.com/jarun/nnn/releases/download/v1.8/nnn-1.8-1.el7.3.centos.x86_64.rpm
  elif [[ $DISTRO == 'ubuntu' || $DISTRO == 'elementary' ]]; then
    sudo add-apt-repository ppa:twodopeshaggy/jarun
    sudo apt-get update && sudo apt-get -y install nnn
  else
    SRC_DIR="~/src"
    NNN_TARBALL="nnn.tar.gz"
    NNN_REPO="jarun/nnn"

    sudo apt-get -y install jq libncursesw5-dev libreadline-dev
    mkdir -p $SRC_DIR/nnn
    cd $SRC_DIR

    NNN_TARBALL_LATEST_URL=$( curl -s "https://api.github.com/repos/$NNN_REPO/releases/latest" \
      | jq -r '.assets[] | select(.name | contains(".tar.gz")) | .browser_download_url' )
    curl -L $NNN_TARBALL_LATEST_URL -o $NNN_TARBALL
    tar xzf $NNN_TARBALL && cd nnn

    make
    sudo make install

    popd
    popd
  fi
fi
