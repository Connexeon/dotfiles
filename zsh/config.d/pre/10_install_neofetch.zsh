####################################################################
# Install neofetch - A command-line system information tool
####################################################################
CMD="neofetch"
CMDTITLE="A command-line system information tool"

if [[ (( ! $+commands[$CMD] )) && !($DOTFILES_NEOFETCH_DISABLED) ]]; then
  echo "Installing $CMD - $CMDTITLE"

  # Distro specific installation steps
  case "$DISTRO" in
    centos|fedora)
      sudo yum install epel-release -y >/dev/null 2>&1 ; \
      sudo curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo >/dev/null 2>&1 ; \
      sudo yum install neofetch -y >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;

    debian|raspbian|ubuntu|elementary|mint)
      sudo apt-get update >/dev/null 2>&1 ; \
      sudo apt-get -y install neofetch >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;

    alpine)
      apk update >/dev/null 2>&1 ; \
      apk add neofetch  >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;

    android)
      pkg update >/dev/null 2>&1 ; \
      pkg install neofetch >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;

    arch)
      pacman -S neofetch >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;

    osx)
      brew install neofetch >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;

    solus)
      brew install neofetch >/dev/null 2>&1 && printf "$OK" || ( printf " $FL" ; exit -1 )
      ;;

    *)
      echo "No install procedure for $CMD for your OS/distro available, please install manually."
      export DOTFILES_NEOFETCH_DISABLED=1
      ;;

  esac
fi

## If command exists: run it
if (( $+commands[$CMD] )) ; then
  echo " " # line spacer
  neofetch
else
  export DOTFILES_NEOFETCH_DISABLED=1
fi
