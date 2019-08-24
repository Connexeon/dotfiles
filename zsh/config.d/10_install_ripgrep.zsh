####################################################################
# Install ripgrep - A fast command-line search tool
####################################################################
CMD="rg"
CMDTITLE="ripgrep, a fast command-line search tool"

_install_ripgrep () {

  # OS specific installation steps
  case "$DISTRO" in
    debian|raspbian|ubuntu|elementary|mint)
      sudo apt -y install ripgrep > /dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    *)
      echo "# Added by .dotfiles 10_install_ripgrep.zsh\nexport DOTFILES_RIPGREP_DISABLED=1" >> $HOME/.zshrc_local

      echo_message error "No install procedure for $1 for your OS/distro available, please install manually. Install disabled in $HOME/.zshrc_local (DOTFILES_RIPGREP_DISABLED)."

      printf "$FL" ; exit 2
      ;;
  esac

}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  if [[ $DOTFILES_RIPGREP_DISABLED=0 ]];  unset DOTFILES_RIPGREP_DISABLED
  if (( ! ${+DOTFILES_RIPGREP_DISABLED} )); then
    printf "Installing $BD$YE$CMD$N - $CMDTITLE"
    _install_ripgrep $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist: run it
else

fi
