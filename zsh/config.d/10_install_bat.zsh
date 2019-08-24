####################################################################
# Install bat - A 'cat' clone with wings
####################################################################
CMD="bat"
CMDTITLE="A 'cat' clone with wings"

_install_bat () {

  LATEST_BAT_VERSION=$( curl -s https://api.github.com/repos/sharkdp/bat/releases/latest | grep '"tag_name":' | cut -d '"' -f 4 | sed 's/v//' )

  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      BAT_FILE_NAME=bat_$LATEST_BAT_VERSION'_'$ARCH2'.deb'
      wget https://github.com/sharkdp/bat/releases/download/v$LATEST_BAT_VERSION/$BAT_FILE_NAME >/dev/null 2>&1 ; \
      sudo dpkg -i $BAT_FILE_NAME >/dev/null 2>&1 ; \
      rm -f $BAT_FILE_NAME >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      echo_message warning "# Added by .dotfiles 10_install_bat.zsh\nexport DOTFILES_BAT_DISABLED=1" >> $HOME/.zshrc_local

      echo_message error "No install procedure for $1 for your OS/distro available, please install manually. Install disabled in $HOME/.zshrc_local (DOTFILES_BAT_DISABLED)."

      exit 2
      ;;
  esac
}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  if (( $DOTFILES_BAT_DISABLED=0)) unset $DOTFILES_BAT_DISABLED
  if (( ! ${+DOTFILES_BAT_DISABLED} )); then
    printf "Installing $B$CMD$N - $CMDTITLE"
    _install_bat $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist: run it
else

fi
