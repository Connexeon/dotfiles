####################################################################
# Install neofetch - A command-line system information tool
####################################################################
# echo_message information "Entering 10_install_neofetch.zsh"

CMD="neofetch"
CMDTITLE="A command-line system information tool"

if [[ (( ! $+commands[$CMD] )) || (( ! $DOTFILES_NEOFETCH_DISABLED )) ]]; then
  echo_message header "Installing $CMD - $CMDTITLE"

  # Distro specific installation steps
  case "$DISTRO" in
    centos)
      superuser_do "yum install epel-release -y" ; \
      superuser_do "curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo" ; \
      superuser_do "yum install neofetch -y" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    fedora)
      superuser_do "dnf install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    ubuntu|elementary)
      superuser_do "add-apt-repository ppa:dawidd0811/neofetch-daily -y -u" ; \
      superuser_do "apt-get --silent update" ; \
      superuser_do "apt-get --silent --yes install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;
    debian|raspbian|ubuntu|elementary|mint)
      superuser_do "apt-get --silent update" ; \
      superuser_do "apt-get --silent --yes install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    alpine)
      apk update ; \
      apk add neofetch  >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    android)
      pkg update ; \
      pkg install neofetch  >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    arch)
      superuser_do "pacman -S neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    osx)
      superuser_do "brew install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    solus)
      superuser_do "eopkg it neofetch" >/dev/null 2>&1  >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit -1 )
      ;;

    *)
      echo "# Added by .dotfiles 10_install_neofetch.zsh\nexport DOTFILES_NEOFETCH_DISABLED=1" >> $HOME/.zshrc_local

      echo_message error "No install procedure for $CMD for your OS/distro available, please install manually. Install disabled in $HOME/.zshrc_local (DOTFILES_NEOFETCH_DISABLED)."
      ;;

  esac
fi

## If command exists: run it
if (( $+commands[$CMD] )) ; then
  echo "" # line spacer
  neofetch
else
  # export DOTFILES_NEOFETCH_DISABLED=1
fi
