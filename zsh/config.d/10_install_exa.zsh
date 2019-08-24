####################################################################
# Install exa - A modern version of ‘ls’
####################################################################
CMD="exa"
CMDTITLE="A modern version of 'ls'"

if (( ! $+commands[$CMD] )); then
  printf "Installing $CMD - $CMDTITLE"

  # OS specific installation steps
  case "$DISTRO" in
    osx)
      brew install exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    arch)
      sudo pacman -S exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    fedora)
      sudo dnf install exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    opensuse)
      sudo zypper install exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    nixos)
      nix-env -i exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    gentoo)
      emerge sys-apps/exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      if [[ $OS = "Linux" ]] ; then
        # Download Linux binary and copy it into /usr/local/bin
        TMP_DIR=$(mktemp -d)
        EXA_ZIP="exa-linux-x86_64-latest.zip"
        EXA_REPO="ogham/exa"
        EXA_ZIP_LATEST_URL=$( curl -s "https://api.github.com/repos/$EXA_REPO/releases/latest" \
          | jq -r '.assets[] | select(.name | contains("exa-linux-x86_64")) | .browser_download_url' ) ; \
        curl -L $EXA_ZIP_LATEST_URL -o $TMP_DIR/$EXA_ZIP >/dev/null 2>&1 ; \
        unzip $TMP_DIR/$EXA_ZIP -d $TMP_DIR && sudo cp $TMP_DIR/exa-linux-x86_64 /usr/local/bin/exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      fi
      ;;
  esac

  # Download/Install shell completion definition
  COMPDEF="/usr/local/share/zsh/site-functions/_exa"
  COMPDEF_URL="https://raw.githubusercontent.com/ogham/exa/master/contrib/completions.zsh"
  if [[ -e "$COMPDEF" ]]; then
    sudo rm -f $COMPDEF
  fi
  printf "Installing $CMD shell completion definitions"
  sudo curl -o $COMPDEF $COMPDEF_URL >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )

fi

# Load if command exists
if (( $+commands[$CMD] )); then

else

fi
