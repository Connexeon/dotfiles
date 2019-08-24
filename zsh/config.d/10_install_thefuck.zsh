####################################################################
# Install thefuck - Magnificent app which corrects your previous console command
####################################################################
CMD="thefuck"
CMDTITLE="Magnificent app which corrects your previous console command"

_install_thefuck () {

  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      superuser_do "apt install -y -qq python3-dev python3-pip python3-setuptools" >/dev/null 2>&1 ; \
      pip3 install --user thefuck >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      echo "# Added by .dotfiles 10_install_thefuck.zsh\nexport DOTFILES_THEFUCK_DISABLED=1" >> $HOME/.zshrc_local

      echo_message warning "No install procedure for $1 for your OS/distro available, please install manually. Install disabled in $HOME/.zshrc_local (DOTFILES_THEFUCK_DISABLED)."

      printf "$FL"
      ;;
  esac

}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  [[ $DOTFILES_THEFUCK_DISABLED == 0 ]] && unset DOTFILES_THEFUCK_DISABLED
  if (( ! ${+DOTFILES_THEFUCK_DISABLED} )); then
    printf "Installing $BD$YE$CMD$N - $CMDTITLE"
    _install_thefuck $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist: run it
else
  # eval $(thefuck --alias)
fi
