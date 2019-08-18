####################################################################
# Install/Reinstall revolver
####################################################################

CMD="revolver"
CMDTITLE="A progress spinner for ZSH scripts"

_install_revolver () {
  CMD=$1
  chmod u+x $HOME/.zsh/submodules/revolver/revolver ; \
  path+=$HOME/.zsh/submodules/revolver >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )

  __curl_compdef $CMD "https://raw.githubusercontent.com/molovo/revolver/master/revolver.zsh-completion" # >/dev/null 2>&1
}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  printf "Installing $CMD - $CMDTITLE"
  _install_revolver $CMD
fi

# If command exists (has succeeded installation)
if (( $+commands[$CMD] )); then
  printf "$CMD exists - (re)installing anyway"
  _install_revolver $CMD
else
fi
