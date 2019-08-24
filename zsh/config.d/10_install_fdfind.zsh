####################################################################
# Install fd - A simple, fast and user-friendly alternative to 'find'
####################################################################
CMD="fdfind"
CMDTITLE="A simple, fast and user-friendly alternative to 'find'"

_install_fdfind () {

  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      superuser_do "apt-get -y -qq install fd-find" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      echo "# Added by .dotfiles 10_install_fdfind.zsh\nexport DOTFILES_FDFIND_DISABLED=1" >> $HOME/.zshrc_local

      echo_message warning "No install procedure for $1 for your OS/distro available, please install manually. Install disabled in $HOME/.zshrc_local (DOTFILES_FDFIND_DISABLED)."
      ;;
  esac

}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  [[ $DOTFILES_FDFIND_DISABLED == 0 ]] && unset DOTFILES_FDFIND_DISABLED
  if (( ! ${+DOTFILES_FDFIND_DISABLED} )); then
    printf "Installing $BD$YE$CMD$N - $CMDTITLE"
    _install_fdfind $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist
else
  alias fd=fdfind
fi
