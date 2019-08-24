####################################################################
# Install/Reinstall revolver
####################################################################

CMD="revolver"
CMDTITLE="A progress spinner for ZSH scripts"

_install_revolver () {
  # revolver is included as a git submodule in these dotfiles, so installing means giving execute permission and adding to PATH
  chmod u+x $HOME/.zsh/submodules/revolver/revolver ; \
  path+=$HOME/.zsh/submodules/revolver >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )

  __curl_compdef $1 "https://raw.githubusercontent.com/molovo/revolver/master/revolver.zsh-completion"
}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  if [[ $DOTFILES_REVOLVER_DISABLED=0 ]]; unset DOTFILES_REVOLVER_DISABLED
  if (( ! ${+DOTFILES_REVOLVER_DISABLED} )); then
    printf "Installing $BD$YE$CMD$N - $CMDTITLE"
    _install_revolver $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist: run it
else

fi
