####################################################################
# Install exa - A modern version of ‘ls’
####################################################################
CMD="exa"
CMDTITLE="A modern version of 'ls'"

_install_exa () {

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
        EXA_ZIP="exa-linux-$ARCH-latest.zip"
        EXA_REPO="ogham/exa"
        EXA_ZIP_LATEST_URL=$( curl -s "https://api.github.com/repos/$EXA_REPO/releases/latest" \
          | jq -r '.assets[] | select(.name | contains("exa-linux-$ARCH")) | .browser_download_url' ) ; \
        curl -L $EXA_ZIP_LATEST_URL -o $TMP_DIR/$EXA_ZIP >/dev/null 2>&1 ; \
        unzip $TMP_DIR/$EXA_ZIP -d $TMP_DIR && sudo cp $TMP_DIR/exa-linux-$ARCH /usr/local/bin/exa >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      fi
      ;;

  esac

  # Download/Install shell completion definition
  __curl_compdef $1 "https://raw.githubusercontent.com/ogham/exa/master/contrib/completions.zsh"
}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  [ $DOTFILES_EXA_DISABLED == 0 ] && unset DOTFILES_EXA_DISABLED
  if (( ! ${+DOTFILES_EXA_DISABLED} )); then
    printf "Installing $BD$YE$CMD$N - $CMDTITLE"
    _install_exa $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist: run it
else

fi
