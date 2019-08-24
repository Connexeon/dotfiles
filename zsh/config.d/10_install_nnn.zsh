####################################################################
# Install nnn - The missing terminal file manager for X
####################################################################
CMD="nnn"
CMDTITLE="The missing terminal file manager for X"

if (( ! $+commands[$CMD] )); then
  echo "Installing $CMD - $CMDTITLE"
  # OS specific installation steps
  case "$DISTRO" in
    ubuntu|elementary)
      sudo add-apt-repository ppa:twodopeshaggy/jarun >/dev/null 2>&1 ; \
      sudo apt update && sudo apt -y install nnn >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
    ;;
    centos)
      sudo rpm -i https://github.com/jarun/nnn/releases/download/v1.8/nnn-1.8-1.el7.3.centos.x86_64.rpm >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
    ;;
    *)
      # echo "No install procedure for $CMD for your OS/distro available, please install manually."
      SRC_DIR=$(mktemp -d)
      NNN_TARBALL="nnn.tar.gz"
      NNN_REPO="jarun/nnn"

      sudo apt -y install build-essential jq libncursesw5-dev libreadline-dev >/dev/null 2>&1

      pushd $SRC_DIR
      NNN_TARBALL_LATEST_URL=$( curl -s "https://api.github.com/repos/$NNN_REPO/releases/latest" \
        | jq -r '.assets[] | select(.name | contains(".tar.gz")) | .browser_download_url' ) ; \
      curl -L $NNN_TARBALL_LATEST_URL -o $NNN_TARBALL >/dev/null 2>&1 ; \
      tar xzf $NNN_TARBALL && cd nnn >/dev/null 2>&1 ; \
      make >/dev/null 2>&1 ; \
      sudo make install >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      popd
    ;;
  esac

  # Download/Install shell completion definition

  __curl_compdef $CMD "https://raw.githubusercontent.com/jarun/nnn/master/misc/auto-completion/zsh/_nnn"

fi

# If command exists (has succeeded installation)
if (( $+commands[$CMD] )); then

  export NNN_OPENER=xdg-open
  export NNN_OPENER="gio open"
  export NNN_OPENER=gvfs-open

  export NNN_USE_EDITOR=1
  export NNN_DE_FILE_MANAGER=nautilus

else

fi
