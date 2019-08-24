####################################################################
# Install neofetch - A command-line system information tool
####################################################################
CMD="neofetch"
CMDTITLE="A command-line system information tool"

_install_neofetch () {

  # Distro specific installation steps
  case "$DISTRO" in
    centos)
      superuser_do "yum install epel-release -y" ; \
      superuser_do "curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo" ; \
      superuser_do "yum install neofetch -y" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    fedora)
      superuser_do "dnf install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    ubuntu|elementary)
      # echo_message information "Distro ubuntu"
      superuser_do "add-apt-repository ppa:dawidd0811/neofetch-daily -y -u" ; \
      superuser_do "apt-get --silent update" ; \
      superuser_do "apt-get --silent --yes install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;
    debian|raspbian|ubuntu|elementary|mint)
      # echo_message information "Distro debian"
      superuser_do "apt-get --silent update" ; \
      superuser_do "apt-get --silent --yes install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    alpine)
      apk update ; \
      apk add neofetch  >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    android)
      pkg update ; \
      pkg install neofetch  >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    arch)
      superuser_do "pacman -S neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    osx)
      superuser_do "brew install neofetch" >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    solus)
      superuser_do "eopkg it neofetch" >/dev/null 2>&1  >/dev/null 2>&1 && printf "$OK" || ( printf "$FL" ; exit 1 )
      ;;

    *)
      echo "# Added by .dotfiles 10_install_neofetch.zsh\nexport DOTFILES_NEOFETCH_DISABLED=1" >> $HOME/.zshrc_local

      echo_message error "No install procedure for $1 for your OS/distro available, please install manually. Install disabled in $HOME/.zshrc_local (DOTFILES_NEOFETCH_DISABLED)."

      printf "$FL" ; exit 2
      ;;

  esac

}

# If command does not exist (not yet installed)
if (( ! $+commands[$CMD] )); then
  # Check for disabled flag overriding auto install
  if (( $DOTFILES_NEOFETCH_DISABLED==0)) unset $DOTFILES_NEOFETCH_DISABLED
  if (( ! ${+DOTFILES_NEOFETCH_DISABLED} )); then
    printf "Installing $B$CMD$N - $CMDTITLE"
    _install_neofetch $CMD
  else
    # TODO: log intended install skip somewhere?
  fi
# If command does exist: run it
else
  echo "" # line spacer
  neofetch
fi
