####################################################################
# Install bat - A 'cat' clone with wings
####################################################################
CMD="bat"
CMDTITLE="A 'cat' clone with wings"

_install_bat () {

  BAT_REPO='sharkdp/bat'
  BAT_LATEST_VERSION=$( curl -s https://api.github.com/repos/$BAT_REPO/releases/latest | grep '"tag_name":' | cut -d '"' -f 4 | sed 's/v//' )
  BAT_DEB_FILE='bat_'$BAT_LATEST_VERSION'_'$ARCH2'.deb'
  BAT_DEB_URL='https://github.com/'$BAT_REPO'/releases/download/v'$BAT_LATEST_VERSION'/'$BAT_DEB_FILE
  TMP_DIR=$(mktemp -d)
  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      curl -L $BAT_DEB_URL -o $TMP_DIR/$BAT_DEB_FILE >/dev/null 2>&1 ; \
      superuser_do "dpkg -i $TMP_DIR/$BAT_DEB_FILE" >/dev/null 2>&1 ; \
      rm -f $TMP_DIR/$BAT_DEB_FILE >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      echo "# Added by .dotfiles 10_install_bat.zsh\nexport DOTFILES_BAT_DISABLED=1" >> $HOME/.zshrc_local

      echo_message warning "No install procedure for $1 for your OS/distro available, please install manually. Install disabled in $HOME/.zshrc_local (DOTFILES_BAT_DISABLED)."

      printf "$FL"
      ;;
  esac
}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  [[ $DOTFILES_BAT_DISABLED == 0 ]] && unset DOTFILES_BAT_DISABLED
  if (( ! ${+DOTFILES_BAT_DISABLED} )); then
    printf "Installing $BD$YE$CMD$N - $CMDTITLE"
    _install_bat $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist: run it
else

fi
