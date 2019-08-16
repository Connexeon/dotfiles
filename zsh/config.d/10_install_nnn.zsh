####################################################################
# Install nnn
####################################################################
if ! (( $+commands[nnn] )); then
  # OS specific installation steps
  case "$DISTRO" in
    ubuntu|elementary)
    sudo add-apt-repository ppa:twodopeshaggy/jarun >/dev/null 2>&1
    sudo apt update && sudo apt -y install nnn >/dev/null 2>&1
    echo " OK"
    ;;
    centos)
    sudo rpm -i https://github.com/jarun/nnn/releases/download/v1.8/nnn-1.8-1.el7.3.centos.x86_64.rpm >/dev/null 2>&1
    ;;
    *)
    # echo "No install procedure for your OS available."
    SRC_DIR=$(mktemp)
    NNN_TARBALL="nnn.tar.gz"
    NNN_REPO="jarun/nnn"

    sudo apt -y install build-essential jq libncursesw5-dev libreadline-dev >/dev/null 2>&1

    cd $SRC_DIR >/dev/null 2>&1
    NNN_TARBALL_LATEST_URL=$( curl -s "https://api.github.com/repos/$NNN_REPO/releases/latest" \
      | jq -r '.assets[] | select(.name | contains(".tar.gz")) | .browser_download_url' )
    curl -L $NNN_TARBALL_LATEST_URL -o $NNN_TARBALL >/dev/null 2>&1
    tar xzf $NNN_TARBALL && cd nnn >/dev/null 2>&1

    make
    sudo make install

    popd
    ;;

  esac
fi
