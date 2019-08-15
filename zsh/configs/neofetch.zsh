####################################################################
# Show system info & some ASCII art
####################################################################
if ! type "neofetch" > /dev/null; then
  # OS specific installation steps
  if [[ $DISTRO == 'darwin' ]]; then
  elif [[ $DISTRO == 'centos' || $DISTRO == 'centminmod' ]]; then
    sudo yum install epel-release -y
    sudo curl -o /etc/yum.repos.d/konimex-neofetch-epel-7.repo https://copr.fedorainfracloud.org/coprs/konimex/neofetch/repo/epel-7/konimex-neofetch-epel-7.repo
    sudo yum install neofetch -y
  elif [[ $DISTRO == 'ubuntu' || $DISTRO == 'elementary' ]]; then
    sudo apt-get install neofetch -y
    if ! type "neofetch" > /dev/null; then
      sudo echo "deb http://dl.bintray.com/dawidd6/neofetch stretch main" | sudo tee -a /etc/apt/sources.list
      sudo curl "https://bintray.com/user/downloadSubjectPublicKey?username=bintray" | sudo apt-key add -
      sudo apt-get update
      sudo apt-get install neofetch -y
    fi
  elif [[ $DISTRO == 'cygwin' ]]; then

  else

  fi
else
  neofetch
fi
